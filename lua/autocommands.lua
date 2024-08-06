local groupid = vim.api.nvim_create_augroup('user', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'yaml',
    group = groupid,
    callback = function ()
        vim.bo.tabstop = 2
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.expandtab = true
    end
})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '*.volt',
    group = groupid,
    callback = function ()
        vim.bo.filetype = 'html'
    end
})
-- To enable inlay hints
--vim.api.nvim_create_autocmd('LspAttach', {
--    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--    callback = function (args)
--        local client = vim.lsp.get_client_by_id(args.data.client_id)
--        if client.server_capabilities.inlayHintProvider then
--            vim.lsp.inlay_hint.enable(args.buf, true)
--        end
--    end
--})

vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
    group = groupid,
    callback = function ()
        vim.lsp.buf.document_highlight()
    end
})
vim.api.nvim_create_autocmd('CursorMoved', {
    group = groupid,
    callback = function ()
        vim.lsp.buf.clear_references()
    end
})
-- Codelens
--vim.api.nvim_create_autocmd({'BufEnter', 'CursorHold', 'InsertLeave'}, {
--    group = groupid,
--    callback = function (args)
--        vim.lsp.codelens.refresh({ bufnr = args.buf })
--    end
--})


-- For some reason, setting opt.mouse too early seems to have no effect
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function ()
        vim.o.mouse = 'a'
    end
})

-- Seems to be happening on more than just json files for some reason
--vim.api.nvim_create_autocmd('FileType', {
--    pattern = 'json',
--    group = groupid,
--    callback = function ()
--        vim.o.foldmethod = 'expr'
--        vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
--    end
--})

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
