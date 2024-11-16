local groupid = vim.api.nvim_create_augroup('user', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'yaml',
    group = groupid,
    callback = function (args)
        vim.bo[args.buf].tabstop = 2
        vim.bo[args.buf].softtabstop = 2
        vim.bo[args.buf].shiftwidth = 2
        vim.bo[args.buf].expandtab = true
    end
})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '*.volt',
    group = groupid,
    callback = function (args)
        vim.bo[args.buf].filetype = 'html'
    end
})


-- For some reason, setting opt.mouse too early seems to have no effect
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function ()
        vim.o.mouse = 'a'
    end
})

-- A little too aggressive, almost perfect
--vim.api.nvim_create_autocmd('WinNew', {
--    pattern = '*',
--    group = groupid,
--    callback = function ()
--        vim.api.nvim_command('wincmd H')
--    end
--})

-- If writing a file in a directory that doesn't exist yet, this will create
-- the directory for you.
vim.api.nvim_create_autocmd('BufWritePre', {
    group = groupid,
    callback = function (context)
        vim.fn.mkdir(vim.fn.fnamemodify(context.file, ':p:h'), 'p')
    end
})
