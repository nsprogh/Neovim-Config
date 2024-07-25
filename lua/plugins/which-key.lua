vim.o.timeout = true
vim.o.timeoutlen = 500

local function show()
    require('which-key').show({ global = false })
end

return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
        {'<Leader>?', show, desc = 'Buffer Local Keymaps (which-key)'}
    },
    opts = {
        plugins = {
            presets = {
                g = false,
                operators = false,
                motions = false,
                windows = false,
                nav = false,
                text_objects = true,
            },
            marks = false,
            registers = false,
            spelling = false
        }
    },
    config = function (_, opts)
        local commands = require('commands')

        require('which-key').setup(opts)
        require('which-key').add({
            {'<leader>c', group = 'Clear'},
            {'<leader>f', group = 'Find'},
            {'<leader>k', group = 'Sidebar'},
            {'<leader>l', group = 'LSP'},
            {'<leader>t', group = 'Terminal'},
            {'<leader>m', group = 'Miscellaneous'}
        })
    end
}
