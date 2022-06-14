-- Auto close blocks. Endwise is for languges with text based block
-- delimiters like Bash (if/fi) and Ruby (if/endif). Closer is for standard
-- braces and other symbol-based block delimiters.

--return 'tpope/vim-endwise'
return 'rstacruz/vim-closer'
-- This works but is ever so slightly perceptible slow compared to
-- vim-closer. I'll try this out later.
--return {
--    'windwp/nvim-autopairs',
--    config = function ()
--        require('nvim-autopairs').setup {
--            check_ts = true
--        }

--        require('nvim-autopairs.completion.compe').setup {
--            map_cr = true,
--            map_complete = false
--        }
--    end
--}
