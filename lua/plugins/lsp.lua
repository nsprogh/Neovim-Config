-- LSP and autocompletion
return {
    'neovim/nvim-lspconfig',
    as = 'lsp',
    -- Only enable for file types that the language server is actually
    -- enabled for
    ft = {
        'rust', 'php', 'typescript', 'javascript', 'c', 'cpp', 'tex',
        'typescriptreact', 'javascriptreact'
    },
    cmd = {'LspInfo', 'LspStart'},
    config = function ()
        require'lspconfig'.eslint.setup {}
        require'lspconfig'.rust_analyzer.setup {}
        require'lspconfig'.intelephense.setup {}
        require'lspconfig'.tsserver.setup {}
        require'lspconfig'.texlab.setup {}
        require'lspconfig'.ccls.setup {}
        require'lspconfig'.psalm.setup {
            cmd = {'psalm-language-server', '--enable-autocomplete=false'}
        }
    end
}
