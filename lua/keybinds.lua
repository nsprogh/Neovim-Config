local command = require 'commands'

vim.keymap.set('n', '<C-k><C-n>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<C-k><C-m>', '<cmd>NvimTreeFindFile<cr>')
vim.keymap.set('n', '<C-k><C-u>', '<cmd>UndotreeToggle<cr>')
vim.keymap.set('n', '<C-k><C-j>', '<cmd>TagbarToggle<cr>')

-- Doesn't work for some reason. Something to do with how vim handles the shift
-- key
--vim.keymap.set({'n', 'i'}, '<C-T><C-T>', '<cmd>tabnew<cr>')

vim.keymap.set({'n', 'i'}, '<C-t><C-t>', '<cmd>tabnext<cr>')
vim.keymap.set({'n', 'i'}, '<C-t><C-r>', '<cmd>tabprevious<cr>')
-- Not needed anymore (probably)
-- ...Was it ever needed? Maybe the new behavior for bdelete is a NeoVim thing
--vim.keymap.set('n', '<C-c>', '<cmd>bp\\<bar>bd #<cr>')
-- LSP and completion
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gr', command.lsp_references)
vim.keymap.set('n', 'gR', vim.lsp.buf.rename)
vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
vim.keymap.set('n', 'gE', '<cmd>TroubleToggle document_diagnostics<cr>')
vim.keymap.set('n', 'gw', vim.lsp.buf.code_action)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('i', '<Tab>', command.smart_tab, { expr = true })
vim.keymap.set('i', '<S-Tab>', command.smart_tab_rev, { expr = true })
vim.keymap.set('n', 'gs', '<cmd>Git<cr>')
vim.keymap.set('n', 'gb', '<cmd>BufferLinePick<cr>')
-- IDK Man...
vim.keymap.set({'n', 'i'}, '<C-`>', '<esc><cmd>vert term<cr>')

---- Find Stuff ----
vim.keymap.set('n', 'ff', command.project_files)
vim.keymap.set('n', 'fg', command.project_grep)
-- Old implementation
--U.map("n", "fm", "<Cmd>:Telescope man_pages sections=[v:count?string(v:count):'ALL']<cr>")
vim.keymap.set('n', 'fm', command.search_man_pages)
vim.keymap.set('n', 'fh', command.search_help)
vim.keymap.set('n', 'fp', command.project_open)

---- Convenience ----
-- Swap between current and previous buffer
vim.keymap.set('n', '<BS>', '<C-^>')
-- Clear search highlights and error messages
vim.keymap.set('n', ';', '<cmd>nohlsearch<cr><bar><cmd>echon<cr>')
-- Scroll using ',' and 'm'
vim.keymap.set('n', ',', '<C-y>')
vim.keymap.set('n', 'm', '<C-e>')
-- Cycle tabs with 'H' and 'L'
vim.keymap.set('n', 'H', 'gT')
vim.keymap.set('n', 'L', 'gt')

-- Terminal
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')
-- TODO create some keybinds for running build commands in a terminal and stuff

---- Window Navigation Keybinds ----
vim.keymap.set({'t', 'i', 'n'}, '<A-h>', '<cmd>wincmd h<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-j>', '<cmd>wincmd j<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-k>', '<cmd>wincmd k<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-l>', '<cmd>wincmd l<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-q>', '<cmd>confirm quit<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-Q>', '<cmd>quit!<cr>')
vim.keymap.set({'i', 'n'}, '<A-c>', '<cmd>bprevious<bar>bdelete #<cr>')
vim.keymap.set({'t'}, '<A-c>', '<cmd>bdelete<cr>')
vim.keymap.set({'i', 'n'}, '<A-C>', '<cmd>bdelete<cr>')
vim.keymap.set({'t'}, '<A-C>', '<cmd>bdelete!<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-v>', '<cmd>vsplit<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-s>', '<cmd>split<cr>')
vim.keymap.set({'i', 'n'}, '<A-w>', '<cmd>write<cr>')
vim.keymap.set({'i', 'n'}, '<A-W>', '<cmd>write!<cr>')
vim.keymap.set({'i', 'n'}, '<A-a>', '<cmd>terminal<cr>')
