-- Treesitter equivalent to context.vim
return {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    config = function ()
        require'treesitter-context'.setup {
            enable = true,
            max_lines = 5
        }
    end
}
