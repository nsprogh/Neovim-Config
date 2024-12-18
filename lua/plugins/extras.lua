return {
    -- Git client
    {
        'tpope/vim-fugitive', tag = 'v3.7',
        cmd = {'Git'},
        keys = {
            {'<leader>gg', ':Git ', desc = 'Start git command'},
            {'<leader>ko', '<cmd>tab Git<cr>', desc = 'Git'}
        }
    },

    -- Surround text with brackets/parens/quotes/etc.
    {'tpope/vim-surround', tag = 'v2.2'},

    -- LaTeX
    {
        'lervag/vimtex', tag = 'v2.15',
        lazy = false,
        -- ft = {'.tex'},
        init = function ()
            vim.g.vimtex_view_method = 'zathura'
        end
    },

    -- Fuzzy finder
    -- Supplanted by Telescope.nvim
    --'ctrlpvim/ctrlp.vim',

    -- Trailing whitespace nagger
    --Currently broken as of 2022-06-29
    --
    --'ntpeters/vim-better-whitespace',

    -- Undo tree side-panel
    {
        'mbbill/undotree', tag = 'rel_6.1',
        keys = {
            {'<leader>ku', vim.cmd.UndotreeToggle, desc = 'Undo Tree'}
        },
        init = function ()
            vim.g.undotree_SplitWidth = vim.g.sidebarwidth
        end
    },

    -- Indent guides
    {
        'lukas-reineke/indent-blankline.nvim', version = 'v3.*',
        main = 'ibl',
        ---@module 'ibl'
        ---@type ibl.config
        opts = {
            indent = { char = '│' },
            scope = {
                show_start = false,
                show_end = false
            }
        }
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

    'norcalli/nvim-colorizer.lua',

    -- Plugin below this one is just better
    --{
    --    'lukas-reineke/headlines.nvim',
    --    dependencies = 'treesitter',
    --    ft = {'markdown'},
    --    config = true
    --},
    {
        'MeanderingProgrammer/render-markdown.nvim', version = 'v7.*',
        -- dependencies = { 'treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ft = 'markdown',
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }
}
