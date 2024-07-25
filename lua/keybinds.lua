local command = require 'commands'

-- For leader keybinds see which-key plugin configuration
vim.keymap.set('n', '<Leader>cc', '<cmd>nohlsearch<cr><bar><cmd>echon<cr>', {desc = 'Clear Messages'})

-- Find
vim.keymap.set('n', '<Leader>ff', command.project_files, {desc = 'Find Files'})
vim.keymap.set('n', '<Leader>fr', command.recent_files, {desc = 'Find Recent File'})
vim.keymap.set('n', '<Leader>fg', command.project_grep, {desc = 'Find Word'})
vim.keymap.set('n', '<Leader>fm', command.search_man_pages, {desc = 'Find Man Page'})
vim.keymap.set('n', '<Leader>fh', command.search_help, {desc = 'Find Help Page'})
vim.keymap.set('n', '<Leader>fp', command.project_open, {desc = 'Find Project'})

-- Sidebar
vim.keymap.set('n', '<Leader>kn', '<cmd>NvimTreeToggle<cr>', {desc = 'File Tree'})
vim.keymap.set('n', '<Leader>km', '<cmd>NvimTreeFindFile<cr>', {desc = 'Show Current Buffer in File Tree'})
vim.keymap.set('n', '<Leader>ku', '<cmd>UndotreeToggle<cr>', {desc = 'Undo Tree'})
vim.keymap.set('n', '<Leader>kj', '<cmd>TagbarToggle<cr>', {desc = 'Tags'})
vim.keymap.set('n', '<Leader>ko', '<cmd>tab Git<cr>', {desc = 'Git'})
vim.keymap.set('n', '<Leader>ke', '<cmd>TroubleToggle document_diagnostics<cr>', {desc = 'Document Errors'})

-- LSP
vim.keymap.set('n', '<Leader>le', vim.diagnostic.open_float, {desc = 'Messages'})
vim.keymap.set('n', '<Leader>lw', vim.lsp.buf.code_action, {desc = 'Code Actions'})
vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, {desc = 'Rename Symbol'})
vim.keymap.set('n', '<Leader>lq', command.quickfix, {desc = 'Quick Fix'})
vim.keymap.set('n', '<Leader>li', '<cmd>LspInfo<cr>', {desc = 'LSP Info'})
vim.keymap.set('n', '<Leader>lf', '<cmd>LspRestart<cr>', {desc = 'Restart Language Server'})

-- Terminal
vim.keymap.set('n', '<Leader>ta', '<cmd>ToggleTermToggleAll<cr>', {desc = 'Show/Hide Terminals'})

-- Miscellaneous
vim.keymap.set('n', '<Leader>mp', '<cmd>Lazy<cr>', {desc = 'Package Manager Status'})


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
--vim.keymap.set({'n', 'i', 't'}, [[<A-\>]], command.toggle_all_terminals)

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
