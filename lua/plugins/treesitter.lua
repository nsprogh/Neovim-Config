-- Treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
        require'nvim-treesitter.configs'.setup {
            highlight = {enable = true},
            indent = {enable = false},
            autopairs = {enable = false},
            context_commentstring = {enable = true}
        }
    end
}
