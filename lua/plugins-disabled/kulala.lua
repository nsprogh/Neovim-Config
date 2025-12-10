---@type LazyPluginSpec
return {
    'mistweaverco/kulala.nvim',
    keys = {
        {'<leader>Rs', function () require('kulala').run() end,
            desc = 'Send request'},
        {'<leader>Ra', function () require('kulala').run_all() end,
            desc = 'Send all requests'},
        {'<leader>Rb', function () require('kulala').scratchpad() end,
            desc = 'Open scratchpad'}
    },
    ft = {'http', 'rest'},
    opts = {}
}
