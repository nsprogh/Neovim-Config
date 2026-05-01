vim.go.timeout = true
vim.go.timeoutlen = 500

vim.pack.add({
    { src = 'https://github.com/folke/which-key.nvim',
      version = vim.version.range('v3.*') }
})

require('which-key').setup({
    icons = {
        mappings = false
    },
    plugins = {
        presets = {
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
})
require('which-key').add({
    -- {'<leader>c', group = 'Clear'},
    {'<leader>f', group = 'Find'},
    {'<leader>k', group = 'Sidebar'},
    -- {'<leader>l', group = 'LSP'},
    {'<leader>m', group = 'Miscellaneous'},
    {'<leader>r', group = 'Remote Session'},
    -- {'<leader>g', group = 'Goto'},
    {'<leader>G', group = 'Git/Hub'},
    {'<leader>T', group = 'Tasks'}
})
