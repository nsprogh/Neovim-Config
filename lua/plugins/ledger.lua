vim.pack.add({
    { src = 'https://github.com/ledger/vim-ledger',
      version = vim.version.range('v1.*') }
})

local groupid = vim.api.nvim_create_augroup('plugins.extras', { clear = true })

-- I think this better aligns with the alignment from ledger itself so that
-- :call ledger#entry() works automatically without re-aligning
vim.g.ledger_align_at = 50
vim.g.ledger_default_commodity = '$'
vim.g.ledger_commodity_sep = ' '
vim.api.nvim_create_autocmd('FileType', {
    desc = 'Journal-specific keymaps',
    group = groupid,
    pattern = 'ledger',
    callback = function (opts)
        vim.keymap.set('i', '<tab>',
                       '<C-r>=ledger#autocomplete_and_align()<cr>',
                       { desc = 'autocomplete and align', buf = opts.buf })
        vim.keymap.set('v', '<tab>',
                       ':LedgerAlign<cr>',
                       { desc = 'align selected transactions', buf = opts.buf })
        vim.keymap.set('i', '<c-e>',
                       '<c-r>=strftime("%Y/%m/%d")<cr> ',
                       { desc = 'new entry', buf = opts.buf })
        vim.keymap.set('n', '<localleader>\\',
                       '<cmd>call ledger#transaction_state_set(line("."), "*")<cr>',
                       { desc = 'clear transaction', buf = opts.buf })
        vim.keymap.set('n', '<localleader>p',
                       '<cmd>call ledger#transaction_post_state_set(line("."), "*")<cr>',
                       { desc = 'clear post', buf = opts.buf })
    end
})
