vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig',
      version = vim.version.range('v2.7.*') }
})

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
    'lua_ls',
    'yamlls',
    'denols'
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

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp', { clear = true }),
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
        end
    end
})
