return {
    'folke/snacks.nvim', version = 'v2.*',
    lazy = false,
    keys = {
        -- Bufdelete maps
        {'<A-c>', function () require('snacks').bufdelete.delete() end,
            mode = {'n', 'i'},
            desc = 'Delete current buffer'},
        {'<A-C>', function () require('snacks').bufdelete.all() end,
            mode = {'n', 'i'},
            desc = 'Delete all but curret buffer'},
        -- Gitbrowse maps
        {'<leader>GX', function () require('snacks').gitbrowse.open() end,
            desc = 'Open remote file in browser'},
        -- Scratch maps
        {'<leader>.', function () require('snacks').scratch.open() end,
            desc = 'Toggle scratch buffer'},
        {'<leader>S', function () require('snacks').scratch.select() end,
            desc = 'Select scratch buffer'}
    },
    opts = {
        indent = {
            indent = { char = '│'},
            scope = { char = '│'},
            animate = { enabled = false },
        },
        input = {},
    }
}
