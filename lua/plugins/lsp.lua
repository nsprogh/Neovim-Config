-- LSP and autocompletion
return {
    'neovim/nvim-lspconfig', version = 'v1.*',
    name = 'lsp',
    dependencies = {'completion'},
    -- Only enable for file types that the language server is actually
    -- enabled for
    ft = {
        'rust', 'php', 'typescript', 'javascript', 'c', 'cpp', 'tex',
        'typescriptreact', 'javascriptreact', 'lua'
    },
    cmd = {'LspInfo', 'LspStart'},
    opts = {
        servers = {
            ts_ls = {},
            eslint = {},
            intelephense = {},
            texlab = {},
            ccls = {},
            rust_analyzer = {},
            psalm = {
                cmd = {'psalm-language-server', '--enable-autocomplete=false'}
            },
            lua_ls = {
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
                                vim.env.VIMRUNTIME
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
            },
        }
    },
    config = function (_, opts)
        local lspconfig = require('lspconfig')
        for server, config in pairs(opts.servers or {}) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end

        -- To enable inlay hints
        --vim.api.nvim_create_autocmd('LspAttach', {
        --    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        --    callback = function (args)
        --        local client = vim.lsp.get_client_by_id(args.data.client_id)
        --        if client.server_capabilities.inlayHintProvider then
        --            vim.lsp.inlay_hint.enable(args.buf, true)
        --        end
        --    end
        --})

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
        -- Codelens
        --vim.api.nvim_create_autocmd({'BufEnter', 'CursorHold', 'InsertLeave'}, {
        --    group = groupid,
        --    callback = function (args)
        --        vim.lsp.codelens.refresh({ bufnr = args.buf })
        --    end
        --})
    end
}
