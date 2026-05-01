vim.pack.add({
    { src = 'https://github.com/tpope/vim-fugitive', version = 'v3.7' },
    { src = 'https://github.com/tpope/vim-rhubarb', version = 'master' },
    { src = 'https://github.com/tpope/vim-surround', version = 'v2.2' },
})

vim.keymap.set('n', '<C-g>',
    '<cmd>tab Git<cr>',
    {desc = 'Git'})
