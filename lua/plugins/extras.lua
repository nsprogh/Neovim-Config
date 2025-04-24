---@type LazySpec
return {
    -- Git client
    {
        'tpope/vim-fugitive', tag = 'v3.7',
        cmd = {'Git'},
        keys = {
            {'<leader>GG', ':Git ', desc = 'Start git command'},
            {'<leader>GP', function () vim.cmd.Git('pull') end,
                desc = 'Git pull'},
            {'<leader>GU', function () vim.cmd.Git('push') end,
                desc = 'Git push'},
            -- TODO get current branch name
            --{'<leader>GY', function () vim.cmd.Git('push -u origin '..'test') end,
            --    desc = 'Git push (set upstream)'},
            {'<leader>ko', '<cmd>tab Git<cr>', desc = 'Git'}
        }
    },

    -- Add GitHub support to fugitive
    {
        'https://github.com/tpope/vim-rhubarb', branch = 'master',
        dependencies = {'tpope/vim-fugitive'},
        cmd = {'GBrowse'},
        keys = {
            {'<leader>GB', function () vim.cmd.GBrowse() end, desc = 'Git Browse'}
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

    'norcalli/nvim-colorizer.lua',

    {
        'MeanderingProgrammer/render-markdown.nvim', version = 'v7.*',
        -- dependencies = { 'treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ft = 'markdown',
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

    -- Seems to have some weird issues
    -- {
    --     'xb-bx/editable-term.nvim',
    --     config = true
    -- }
}
