-- LSP and autocompletion
return {
    'neovim/nvim-lspconfig',
    config = function ()
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
