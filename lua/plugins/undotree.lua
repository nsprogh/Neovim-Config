vim.cmd.packadd('nvim.undotree')

vim.keymap.set('n', '<leader>ku',
    function() require('undotree').open() end,
    {desc = 'undo tree'})
