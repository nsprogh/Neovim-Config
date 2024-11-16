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

    -- Indent guides
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
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
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ft = 'markdown',
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }
}
