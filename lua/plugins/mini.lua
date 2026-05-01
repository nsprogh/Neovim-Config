vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.nvim', version = 'main' }
})

local groupid = vim.api.nvim_create_augroup('plugins.mini', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', {
    desc = 'Load autopairs',
    group = groupid,
    callback = function ()
        require('mini.pairs').setup()
    end
})
