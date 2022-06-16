-- Treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
        require'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                -- add languages not supported by treesitter here
                additional_vim_regex_highlighting = false
            },
            indent = {enable = true},
            autopairs = {enable = false},
            context_commentstring = {enable = true}
        }

        -- Maybe setup and tune folding later
        --vim.o.foldmethod = 'expr'
        --vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    end
}
