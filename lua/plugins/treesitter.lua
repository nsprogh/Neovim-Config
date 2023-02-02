-- Treesitter
return function (use)
    use {
        'nvim-treesitter/nvim-treesitter',
        as = 'treesitter',
        run = ':TSUpdate',
        config = function ()
            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = false,
                    -- add languages not supported by treesitter here
                    additional_vim_regex_highlighting = false
                },
                indent = {enable = false},
                autopairs = {enable = false},
                context_commentstring = {enable = true}
            }

            -- Maybe setup and tune folding later
            --vim.o.foldmethod = 'expr'
            --vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
        end
    }

    -- use {'nvim-treesitter/nvim-treesitter-angular', after = 'treesitter'}

    -- Treesitter equivalent to context.vim
    use {
        'nvim-treesitter/nvim-treesitter-context',
        after = 'treesitter',
        config = function ()
            require'treesitter-context'.setup {
                enable = true,
                max_lines = 5
            }
        end
    }

    -- This updates commentstring as needed when in polyglot filetypes
    -- (e.g. TSX or HTML files)
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        after = {'treesitter', 'nvim-treesitter-context'}
    }
end
