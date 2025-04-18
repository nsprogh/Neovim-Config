-- See https://github.com/neovim/neovim/issues/29225
-- and https://github.com/neovim/neovim/issues/29225#issuecomment-2468953172
----------------- Add support for async documentation in LSP ------------------
local function is_documentation_disabled()
	local options = vim.opt.completeopt:get()
	for _, option in ipairs(options) do
		if option == "popup" then
			return false
		end
		if option == "preview" then
			return false
		end
	end
	return true
end

local function get_preview_type()
	local type = nil
	local options = vim.opt.completeopt:get()
	for _, option in ipairs(options) do
		if option == "popup" then
			return "popup"
		end
		if option == "preview" then
			type = "preview"
		end
	end
	return type
end

---@class PreviewCompleteInfo
---@field selected integer
---@field preview_bufnr? integer
---@field preview_winid? integer

---@return PreviewCompleteInfo
local function get_preview_info()
	local complete_info = vim.fn.complete_info({
		"selected",
		"preview_winid",
		"preview_bufnr",
	})

	if get_preview_type() == "preview" then
		for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			local wininfo = vim.fn.getwininfo(winid)[1]
			local window_type = vim.fn.win_gettype(wininfo.winnr)
			if window_type == "preview" then
				complete_info.preview_winid = winid
				complete_info.preview_bufnr = wininfo.bufnr
				return complete_info
			end
		end
	end
	return complete_info
end

---@param documentation string|lsp.MarkupContent|nil
local function is_lsp_completion_documention_empty(documentation)
	return documentation == nil
		or documentation == ""
		or (type(documentation) == table and documentation.value == "")
		or (type(documentation) == table and documentation.value == nil)
end

---@param lsp_documentation string|lsp.MarkupContent
---@param selected integer index of selected completion item 0-indexed
local function display_documentation_popup(lsp_documentation, selected)
	local kind = lsp_documentation and lsp_documentation.kind
	local filetype = kind == "markdown" and "markdown" or ""
	local documentation_value = type(lsp_documentation) == "string" and lsp_documentation or lsp_documentation.value
	local preview_info = vim.api.nvim__complete_set(selected, {
		info = documentation_value,
	})
	if preview_info.bufnr ~= nil then
		vim.bo[preview_info.bufnr].filetype = filetype
		if filetype == "markdown" then
			vim.treesitter.start(preview_info.bufnr)
		end
	end
end

---@param lsp_documentation string|lsp.MarkupContent
local function display_documentation_preview(lsp_documentation)
	local kind = lsp_documentation and lsp_documentation.kind
	local filetype = kind == "markdown" and "markdown" or ""
	local documentation_value = type(lsp_documentation) == "string" and lsp_documentation or lsp_documentation.value

	local preview_buf_name = "Documentation\\ Preview"
	vim.cmd(
		"silent! pedit! +setlocal\\ buftype=nofile\\ nobuflisted\\ noswapfile\\ filetype="
			.. filetype
			.. " "
			.. preview_buf_name
	)
	local preview_info = get_preview_info()
	if preview_info.preview_bufnr ~= nil then
		local lines = vim.split(documentation_value, "\n")
		vim.api.nvim_buf_set_lines(preview_info.preview_bufnr, 0, -1, false, lines)
		vim.bo[preview_info.preview_bufnr].filetype = filetype
		if filetype == "markdown" then
			vim.treesitter.start(preview_info.preview_bufnr)
		end
	end
end

---@param lsp_documentation string|lsp.MarkupContent
local function refresh_documentation(lsp_documentation)
	local complete_info = get_preview_info()
	--we do this check here so that we don't close the completion window
	--if we are not going to replace it.
	if is_lsp_completion_documention_empty(lsp_documentation) then
		return
	elseif complete_info.preview_bufnr == nil and get_preview_type() ~= "preview" then
		--If the documentation buffer is already closed and does not need to be
		--a "preview" window we can just create a new one without needing to schedule it
		display_documentation_popup(lsp_documentation, complete_info.selected)
	else
		--Since the preview buffer is already open we need to close it and reopen a new
		--one so that the treesitter highlights refresh. (I at least couldn't figure out a
		--better way to achieve this. I tried a lot things)
		vim.schedule(function()
			if get_preview_type() == "preview" then
				display_documentation_preview(lsp_documentation)
				return
			end

			local current_complete_info = vim.fn.complete_info({
				"selected",
				"preview_winid",
				"preview_bufnr",
			})
			if current_complete_info.preview_winid ~= nil then
				--HACK: nvim_win_hide will cause a whole new
				--buffer and window to be generated when I call nvim__complete_set
				--Since it is a new buffer, it will recalculate
				--the the treesitter highlights correctly. Without this
				--the treessiter highlights won't refresh
				vim.api.nvim_win_hide(current_complete_info.preview_winid)
			end
			display_documentation_popup(lsp_documentation, current_complete_info.selected)
		end)
	end
end

local function set_documentation(completion_item)
	if completion_item == nil then
		return
	end

	local lsp_completion_item = vim.tbl_get(completion_item, "user_data", "nvim", "lsp", "completion_item")
	local complete_info = get_preview_info()

	local preview_bufnr = complete_info.preview_bufnr
	if lsp_completion_item == nil then
		--Handle non-lsp completion items
		if preview_bufnr ~= nil and completion_item.word ~= nil and completion_item.word ~= "" then
			vim.bo[preview_bufnr].filetype = ""
		end
		return
	end

	---@type string|lsp.MarkupContent
	local lsp_documentation = lsp_completion_item.documentation
	if lsp_documentation ~= nil then
		--Handle lsp completion items with documentation already supplied
		refresh_documentation(lsp_documentation)
		return
	end

	--Handle lsp completion items that need documentation resolved
	local client_id = vim.tbl_get(completion_item, "user_data", "nvim", "lsp", "client_id")
	local client = vim.lsp.get_client_by_id(client_id)
	if client == nil then
		return
	end

	local is_resolve_support = true --TODO actually check for resolve support
	if not is_resolve_support then
		return
	end
	client:request(vim.lsp.protocol.Methods.completionItem_resolve, lsp_completion_item, function(err, result, _)
		if err ~= nil then
			vim.print(err)
			return
		end
		local documentation = result and result.documentation
		refresh_documentation(documentation)
	end)
end

local function enable_completion_resolve_documentation(bufnr)
	vim.api.nvim_create_autocmd("CompleteChanged", {
		group = vim.api.nvim_create_augroup("completion.documentation" .. bufnr, { clear = true }),
		buffer = bufnr,
		callback = function(_)
			if tonumber(vim.fn.pumvisible()) == 0 or is_documentation_disabled() then
				return
			end
			local event = vim.v.event --need to grab from vim.v.event
			set_documentation(event.completed_item)
		end,
	})
end

---@type LazySpec
return {
    -- v2.0.0 doesn't have vim.lsp support yet
    'neovim/nvim-lspconfig', branch = 'master',
    -- Should/can this be lazy loaded?
    config = function ()
        -- TODO these check for executables on startup, is there a way to only
        -- check the necessary LSP configs on relevant ft?
        vim.lsp.enable({
            'ts_ls',
            -- 'eslint',
            'intelephense',
            'psalm',
            'texlab',
            -- 'ccls',
            'rust_analyzer',
            'lua_ls'
        })

        vim.lsp.config('psalm', {
            cmd = {'psalm-language-server', '--enable-autocomplete=false'}
        })

        vim.lsp.config('lua_ls', {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            vim.fn.stdpath('data')..'/lazy',
                            -- Depending on the usage, you might want to add additional paths here.
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                        -- library = vim.api.nvim_get_runtime_file("", true)
                    }
                })
            end,
            settings = {
                Lua = {}
            }
        })

        --------------------- AUTOCMDS ----------------------------------------

        local groupid = vim.api.nvim_create_augroup('lsp', { clear = true })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = groupid,
            desc = 'LSP Extras',
            callback = function (event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if not client then
                    return
                end

                if client:supports_method(vim.lsp.protocol.Methods.textDocument_hover) then
                    local hovergroup = vim.api.nvim_create_augroup('lsp-hover', { clear = true })
                    vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
                        group = hovergroup,
                        buffer = event.buf,
                        callback = function ()
                            vim.lsp.buf.document_highlight()
                        end
                    })
                    vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'}, {
                        group = hovergroup,
                        buffer = event.buf,
                        callback = function ()
                            vim.lsp.buf.clear_references()
                        end
                    })
                end
            end
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = groupid,
            desc = 'LSP Autocompletion',
            callback = function (event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if not client then
                    return
                end

                if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
                    vim.lsp.completion.enable(true, client.id, event.buf, {
                        autotrigger = true,
                        convert = function (item)
                            return { abbr = item.label:gsub('%b()', '') }
                        end
                    })

                    -- See https://github.com/neovim/neovim/issues/29225#issuecomment-2468953172
                    enable_completion_resolve_documentation(event.buf)
                end
            end
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = groupid,
            desc = 'LSP Buffer-local keymaps',
            callback = function (event)
                local options = {buffer = event.buf}

                vim.keymap.set({'n', 'x'}, 'gQ',
                    function () vim.lsp.buf.format({ async = true }) end,
                    {buffer = event.buf, desc = 'Format entire buffer with LSP'})
            end
        })

        -- To enable inlay hints
        --vim.api.nvim_create_autocmd('LspAttach', {
        --    group = groupid,
        --    callback = function (args)
        --        local client = vim.lsp.get_client_by_id(args.data.client_id)
        --        if client.server_capabilities.inlayHintProvider then
        --            vim.lsp.inlay_hint.enable(args.buf, true)
        --        end
        --    end
        --})

        -- Useful when I figure out how to set default folds better
        --vim.api.nvim_create_autocmd('LspAttach', {
        --    group = groupid,
        --    desc = 'LSP-specific capabilities/settings',
        --    callback = function (event)
        --        local client = vim.lsp.get_client_by_id(event.data.client_id)
        --        if client and client:supports_method('textDocument/foldingRange') then
        --            local window = vim.api.nvim_get_current_win()
        --            vim.wo[window][0].foldmethod = 'expr'
        --            vim.wo[window][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        --        end
        --    end
        --})
        --vim.api.nvim_create_autocmd('LspDetach', { command = 'setl foldexpr<' })
    end
}
