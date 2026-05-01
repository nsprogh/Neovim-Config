vim.pack.add({
    { src = 'https://github.com/akinsho/toggleterm.nvim', version = 'v2.13.0' }
})

require('toggleterm').setup({
    open_mapping = nil
})

vim.keymap.set({'n', 'i', 't'}, '<C-`>',
    function () require('toggleterm').toggle(vim.v.count) end,
    { desc = 'toggle terminal' })

vim.keymap.set({'n', 'i', 't'}, '<A-`>',
    function () require('toggleterm').toggle_all() end,
    { desc = 'toggle all terminals' })
