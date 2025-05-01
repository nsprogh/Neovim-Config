-- Auto close blocks. Endwise is for languges with text based block
-- delimiters like Bash (if/fi) and Ruby (if/endif). Closer is for standard
-- braces and other symbol-based block delimiters.

--return 'tpope/vim-endwise'
-- Seems to have some kind of issues/conflicts with nvim-cmp and the <cr> key
--return 'rstacruz/vim-closer'
-- This works but is ever so slightly perceptible slow compared to
-- vim-closer.
return {
    'windwp/nvim-autopairs', branch = 'master',
    event = 'InsertEnter',
    opts = {
        check_ts = false
    }
}
