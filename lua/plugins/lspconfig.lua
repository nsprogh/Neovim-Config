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

        vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
            group = groupid,
            callback = function ()
                vim.lsp.buf.document_highlight()
            end
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            group = groupid,
            callback = function ()
                vim.lsp.buf.clear_references()
            end
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = groupid,
            desc = 'LSP Autocompletion',
            callback = function (event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client:supports_method('textDocument/completion') then
                    vim.lsp.completion.enable(true, client.id, event.buf, {
                        autotrigger = true,
                        convert = function (item)
                            return { abbr = item.label:gsub('%b()', '') }
                        end
                    })
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
