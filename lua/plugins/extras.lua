return {
    -- Git client
    {
        'tpope/vim-fugitive',
        cmd = {'Git'}
    },

    -- Surround text with brackets/parens/quotes/etc.
    'tpope/vim-surround',

    -- Fuzzy finder
    -- Supplanted by Telescope.nvim
    --'ctrlpvim/ctrlp.vim',

    -- Trailing whitespace nagger
    --Currently broken as of 2022-06-29
    --
    --'ntpeters/vim-better-whitespace',

    -- Undo tree side-panel
    {
        'mbbill/undotree',
        cmd = {'UndotreeToggle', 'UndotreeOpen'}
    },

    -- Tags side-panel
    {
        'preservim/tagbar',
        cmd = {'TagbarToggle', 'TagbarOpen'}
    },

    -- Indent guides
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require'ibl'.setup {
                indent = { char = '│' },
                scope = {
                    show_start = false,
                    show_end = false
                }
            }
        end
    },

    -- <C-A>/<C-X> increment decrement
    -- {
    --     'nat-418/boole.nvim',
    --     config = function ()
    --         require'boole'.setup {
    --             mappings = {
    --                 increment = '<C-a>',
    --                 decrement = '<C-x>'
    --             }
    --         }
    --     end
    -- },

    {
        'lukas-reineke/headlines.nvim',
        ft = {'markdown'},
        config = function()
            require('headlines').setup()
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    },
}
