return function (use)
    -- Git client
    use {
        'tpope/vim-fugitive',
        cmd = {'Git'}
    }

    -- Surround text with brackets/parens/quotes/etc.
    use 'tpope/vim-surround'

    -- Fuzzy finder
    -- Supplanted by Telescope.nvim
    --use 'ctrlpvim/ctrlp.vim'

    -- Trailing whitespace nagger
    -- Currently broken as of 2022-06-29
    --
    -- use 'ntpeters/vim-better-whitespace'

    -- Undo tree side-panel
    use {
        'mbbill/undotree',
        cmd = {'UndotreeToggle', 'UndotreeOpen'}
    }

    -- Tags side-panel
    use {
        'preservim/tagbar',
        cmd = {'TagbarToggle', 'TagbarOpen'}
    }

    -- Indent guides
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require'indent_blankline'.setup {
                show_current_context = true
            }
        end
    }

    -- <C-A>/<C-X> increment decrement
    use {
        'nat-418/boole.nvim',
        config = function ()
            require'boole'.setup {
                mappings = {
                    increment = '<C-a>',
                    decrement = '<C-x>'
                }
            }
        end
    }

    use {
        'lukas-reineke/headlines.nvim',
        ft = {'markdown'},
        config = function()
            require('headlines').setup()
        end
    }
end
