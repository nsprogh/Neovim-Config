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
    use 'ntpeters/vim-better-whitespace'

    -- Undo tree side-panel
    use {
        'mbbill/undotree',
        opt = true,
        cmd = {'UndotreeToggle', 'UndotreeOpen'}
    }

    -- Tags side-panel
    use {
        'preservim/tagbar',
        opt = true,
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
end
