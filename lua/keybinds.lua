local command = require 'commands'

-- For leader groups see which-key plugin configuration

-- See also <C-l>
vim.keymap.set('n', '<Leader>cc', '<cmd>nohlsearch<cr><bar><cmd>echon<cr>', {desc = 'Clear Messages'})

-- Find
--vim.keymap.set('n', '<Leader>ff', command.project_files, {desc = 'Find Files'})
--vim.keymap.set('n', '<Leader>fr', command.recent_files, {desc = 'Find Recent File'})
--vim.keymap.set('n', '<Leader>fg', command.project_grep, {desc = 'Find Word'})
--vim.keymap.set('n', '<Leader>fm', command.search_man_pages, {desc = 'Find Man Page'})
--vim.keymap.set('n', '<Leader>fh', command.search_help, {desc = 'Find Help Page'})
--vim.keymap.set('n', '<Leader>fp', command.project_open, {desc = 'Find Project'})

-- Sidebar
--vim.keymap.set('n', '<Leader>kn', '<cmd>NvimTreeToggle<cr>', {desc = 'File Tree'})
--vim.keymap.set('n', '<Leader>km', '<cmd>NvimTreeFindFile<cr>', {desc = 'Show Current Buffer in File Tree'})
--vim.keymap.set('n', '<Leader>ku', '<cmd>UndotreeToggle<cr>', {desc = 'Undo Tree'})
--vim.keymap.set('n', '<Leader>kj', '<cmd>TagbarToggle<cr>', {desc = 'Tags'})
--vim.keymap.set('n', '<Leader>ko', '<cmd>tab Git<cr>', {desc = 'Git'})
--vim.keymap.set('n', '<Leader>ke', '<cmd>TroubleToggle document_diagnostics<cr>', {desc = 'Document Errors'})

-- LSP
-- Where should this go if not in the "lsp" section
vim.keymap.set('n', '<Leader>le', function () vim.diagnostic.open_float() end, {desc = 'Messages'})
--vim.keymap.set('n', '<Leader>lw', vim.lsp.buf.code_action, {desc = 'Code Actions'})
--vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, {desc = 'Rename Symbol'})
--vim.keymap.set('n', '<Leader>lq', command.quickfix, {desc = 'Quick Fix'})
--vim.keymap.set('n', '<Leader>li', '<cmd>LspInfo<cr>', {desc = 'LSP Info'})
--vim.keymap.set('n', '<Leader>lf', '<cmd>LspRestart<cr>', {desc = 'Restart Language Server'})

-- Miscellaneous
vim.keymap.set('n', '<Leader>mp', '<cmd>Lazy<cr>', {desc = 'Package Manager Status'})

-- Goto
-- Use [d instead
--vim.keymap.set('n', 'gw', vim.diagnostic.goto_prev, {desc = 'Goto Previous Diagnostic'})
-- Use ]d instead
--vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, {desc = 'Goto Next Diagnostic'})
vim.keymap.set('n', ']E', command.next_error_global, {desc = 'Goto Next Error All Buffers'})
--vim.keymap.set('n', 'gb', command.goto_buffer, {desc = 'Goto Buffer'})

-- View
-- vim.keymap.set('n', ';', vim.lsp.buf.hover)

-- LSP tweaks
--vim.keymap.set('i', '<Tab>', command.smart_tab, { expr = true })
--vim.keymap.set('i', '<S-Tab>', command.smart_tab_rev, { expr = true })

---- ToggleTerm ----
--vim.keymap.set({'n', 'i', 't'}, [[<A-\>]], command.toggle_all_terminals)

-- TODO use ft local buffer maps
vim.keymap.set('n', '<leader>gc', command.angular_goto_component, {desc = 'Goto Angular component'})
vim.keymap.set('n', '<leader>gt', command.angular_goto_template, {desc = 'Goto Angular template'})
vim.keymap.set('n', '<leader>gs', command.angular_goto_style, {desc = 'Goto Angular style'})
vim.keymap.set('n', '<leader>gu', command.angular_goto_spec, {desc = 'Goto Angular unit tests'})

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
