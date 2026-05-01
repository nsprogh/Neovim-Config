local groupid = vim.api.nvim_create_augroup('plugins.markdown', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    desc = 'Lazy-load markdown formatting',
    group = groupid,
    callback = function ()
        vim.pack.add({
            -- TODO add dep for treesitter
            'https://github.com/nvim-tree/nvim-web-devicons',
            { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim',
              version = vim.version.range('v7.*') }
        })

        require('render-markdown').setup()
    end
})
