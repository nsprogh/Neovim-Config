local cmd = vim.cmd

cmd("autocmd! FileType yaml setlocal ts=2 sts=2 sw=2 expandtab")
cmd("autocmd! BufRead,BufNewFile *.volt setfiletype html")
--cmd("autocmd vimenter * ++nested colorscheme solarized8")
-- A little too aggressive, almost perfect
--cmd("autocmd WinNew * wincmd H")
