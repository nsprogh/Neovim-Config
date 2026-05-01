-- For leader groups see which-key plugin configuration

-- See also <C-l>
--vim.keymap.set('n', '<Leader>cc', '<cmd>nohlsearch<cr><bar><cmd>echon<cr>', {desc = 'Clear Messages'})

-- Miscellaneous
vim.keymap.set('n', '<Leader>mp', '<cmd>Lazy<cr>', {desc = 'Package Manager Status'})

-- Goto
-- Use [d instead
--vim.keymap.set('n', 'gw', vim.diagnostic.goto_prev, {desc = 'Goto Previous Diagnostic'})
-- Use ]d instead
--vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, {desc = 'Goto Next Diagnostic'})
vim.keymap.set('n', ']E', require('commands').next_error_global, {desc = 'Goto Next Error All Buffers'})
--vim.keymap.set('n', 'gb', command.goto_buffer, {desc = 'Goto Buffer'})

---- Convenience ----
-- Swap between current and previous buffer
vim.keymap.set('n', '<BS>', '<C-^>', {desc = 'Swap current and previous buffer'})
-- Scroll using ',' and 'm'
vim.keymap.set('n', ',', '<C-y>', {desc = 'Scroll up by line'})
vim.keymap.set('n', 'm', '<C-e>', {desc = 'Scroll down by line'})
-- Cycle tabs with 'H' and 'L'
vim.keymap.set('n', 'H', 'gT', {desc = 'Next tab'})
vim.keymap.set('n', 'L', 'gt', {desc = 'Previous tab'})
vim.keymap.set('n', 'yc', 'yygccp', {remap = true, desc = 'Duplicate a line and comment out the original'})
vim.keymap.set('n', 'vy', '`[v`]', {desc = 'Select recently pasted/yanked/changed text'})
-- Conflicts with <C-I>
--vim.keymap.set('n', '<tab>', 'za', {desc = 'Toggle fold under cursor'})
vim.keymap.set('n', '<leader>kn', '<cmd>edit .<cr>', {desc = 'Netrw'})
vim.keymap.set('n', '<leader>km', '<cmd>edit %:h<cr>', {desc = 'Netrw current buffer'})

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
vim.keymap.set({'t', 'i', 'n'}, '<A-v>', '<cmd>vsplit<cr>')
vim.keymap.set({'t', 'i', 'n'}, '<A-s>', '<cmd>split<cr>')
vim.keymap.set({'i', 'n'}, '<A-w>', '<cmd>write<cr>')
vim.keymap.set({'i', 'n'}, '<A-W>', '<cmd>write!<cr>')
vim.keymap.set({'i', 'n'}, '<A-a>', '<cmd>terminal<cr>')
vim.keymap.set({'i', 'n'}, '<A-t>', '<cmd>tabnew<cr>')
vim.keymap.set({'i', 'n'}, '<A-T>', '<cmd>tabclose<cr>')
