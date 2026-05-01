vim.pack.add({
    { src = 'https://github.com/folke/snacks.nvim',
      version = vim.version.range('v2.*') }
})

require('snacks').setup({
    indent = {
        indent = { char = '│'},
        scope = { char = '│'},
        animate = { enabled = false },
    },
    input = {}
})

vim.keymap.set({'n', 'i'}, '<A-c>',
    function () require('snacks.bufdelete').delete() end,
    { desc = 'delete current buffer' })

vim.keymap.set({'n', 'i'}, '<A-C>',
    function () require('snacks.bufdelete').all() end,
    { desc = 'delete all but current buffer' })
