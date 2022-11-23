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

    -- Toggleable Terminal
    use {
        'akinsho/toggleterm.nvim',
        config = function ()
            require'toggleterm'.setup {
                size = 72,
                open_mapping = [[<A-\>]],
                direction = 'vertical'
            }
        end
    }
end
