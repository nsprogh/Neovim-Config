-- LSP and autocompletion
return {
    'neovim/nvim-lspconfig',
    name = 'lsp',
    dependencies = {
        {
            -- nvim-cmp integration
            'hrsh7th/cmp-nvim-lsp',
            dependencies = {'completion'},
            config = function ()
                -- Setup lspconfig.
                local capabilities = require('cmp_nvim_lsp')
                    .default_capabilities(vim.lsp.protocol.make_client_capabilities())
                -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
                require('lspconfig').tsserver.setup({capabilities = capabilities})
            end
        },
        -- {
        --     'ray-x/lsp_signature.nvim',
        --     name = 'signature-help',
        --     dependencies = {'completion'},
        --     opts = {
        --         hint_enable = false,
        --         max_height = 10,
        --         max_width = 80,
        --         wrap = false,
        --         handler_opts = {
        --             border = 'none'
        --         }
        --     }
        -- }
    },
    -- Only enable for file types that the language server is actually
    -- enabled for
    ft = {
        'rust', 'php', 'typescript', 'javascript', 'c', 'cpp', 'tex',
        'typescriptreact', 'javascriptreact'
    },
    cmd = {'LspInfo', 'LspStart'},
    config = function ()
        require('lspconfig').eslint.setup({})
        require('lspconfig').rust_analyzer.setup({})
        require('lspconfig').intelephense.setup({})
        require('lspconfig').tsserver.setup({})
        require('lspconfig').texlab.setup({})
        require('lspconfig').ccls.setup({})
        require('lspconfig').psalm.setup({
            cmd = {'psalm-language-server', '--enable-autocomplete=false'}
        })
    end
}
