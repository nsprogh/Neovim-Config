local command = require 'commands'

vim.g.mapleader = ' ' -- spacebar for leader
-- For leader keybinds see which-key plugin configuration

-- Goto
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'Goto Definition'})
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, {desc = 'Goto Type Definition'})
vim.keymap.set('n', 'gr', command.lsp_references, {desc = 'Goto References'})
vim.keymap.set('n', 'gw', vim.diagnostic.goto_prev, {desc = 'Goto Previous Diagnostic'})
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, {desc = 'Goto Next Diagnostic'})
vim.keymap.set('n', 'gb', command.goto_buffer, {desc = 'Goto Buffer'})

-- View
vim.keymap.set('n', ';', vim.lsp.buf.hover)

-- LSP tweaks
vim.keymap.set('i', '<Tab>', command.smart_tab, { expr = true })
vim.keymap.set('i', '<S-Tab>', command.smart_tab_rev, { expr = true })

---- ToggleTerm ----
vim.keymap.set({'n', 'i', 't'}, [[<A-\>]], command.toggle_all_terminals)

---- Convenience ----
-- Swap between current and previous buffer
vim.keymap.set('n', '<BS>', '<C-^>')
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
vim.keymap.set({'i', 'n'}, '<A-t>', '<cmd>tabnew<cr>')
vim.keymap.set({'i', 'n'}, '<A-T>', '<cmd>tabclose<cr>')
