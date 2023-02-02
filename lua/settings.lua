-- Global options
-- New Lua-based filetype detection, comment out to revert to old .vim ft code
-- Some filetypes are not supported in the Lua version
--vim.g.do_filetype_lua = 1
--vim.g.did_load_filetypes = 0

-- Editor Options
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.backspace = '2'
vim.o.encoding = 'UTF-8'
vim.o.updatetime = 1000
vim.o.autoread = true
vim.o.ruler = true
vim.o.synmaxcol = 255
vim.o.mouse = 'a'
vim.o.undofile = true
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.o.cmdheight = 0

-- Window-Local Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.colorcolumn='80'
