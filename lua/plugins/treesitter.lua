-- Treesitter
return {
    'nvim-treesitter/nvim-treesitter',
    name = 'treesitter',
    build = ':TSUpdate',
    dependencies = {
        --'nvim-treesitter/nvim-treesitter-angular',
        {
            -- Treesitter equivalent to context.vim
            'nvim-treesitter/nvim-treesitter-context',
            opts = {
                enable = true,
                max_lines = 5
            }
        },
    },
    -- TODO hardcode the treesitter languages to install and match it to
    -- this list
    ft = {'typescript', 'html', 'markdown', 'rust', 'php', 'java', 'json'},
    config = function ()
        require'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                -- add languages not supported by treesitter here
                additional_vim_regex_highlighting = false
            },
            indent = {enable = true},
            autopairs = {enable = false},
        }

        require'nvim-treesitter.install'.prefer_git = false

        -- Maybe setup and tune folding later
        --vim.o.foldmethod = 'expr'
        --vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    end
}
