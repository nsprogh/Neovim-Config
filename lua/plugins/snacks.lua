return {
    'folke/snacks.nvim', version = 'v2.*',
    priority = 1000,
    lazy = false,
    keys = {
        -- Bufdelete maps
        {'<A-c>', function () require('snacks.bufdelete').delete() end,
            mode = {'n', 'i'},
            desc = 'Delete current buffer'},
        {'<A-C>', function () require('snacks.bufdelete').all() end,
            mode = {'n', 'i'},
            desc = 'Delete all but curret buffer'},
        -- Scratch maps
        {'<leader>.', function () require('snacks.scratch').open() end,
            desc = 'Toggle scratch buffer'},
        {'<leader>S', function () require('snacks.scratch').select() end,
            desc = 'Select scratch buffer'}
    },
    ---@type snacks.Config
    opts = {
        indent = {
            indent = { char = '│'},
            scope = { char = '│'},
            animate = { enabled = false },
        },
        input = {},
    }
}
