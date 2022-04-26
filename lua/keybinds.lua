-- OLD COMMAND: U.map(mode, keybind, command)
--   where U is imported from utils.lua

-- Builtin file manager
--U.map("n", "<C-k><C-n>", "<Cmd>Ntree<CR>")
-- Sidebar file manager
vim.keymap.set('n', '<C-k><C-n>', '<CMD>NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-k><C-m>', '<CMD>NvimTreeFindFile<CR>')
vim.keymap.set('n', '<C-k><C-u>', '<CMD>UndotreeToggle<CR>')
vim.keymap.set('n', '<C-k><C-j>', '<CMD>TagbarToggle<CR>')

-- Doesn't work for some reason. Something to do with how vim handles the shift
-- key
--U.map("n", "<C-T><C-T>", "<Cmd>tabnew<CR>")
--U.map("i", "<C-T><C-T>", "<Esc><Cmd>tabnew<CR>")

vim.keymap.set({'n', 'i'}, '<C-t><C-t>', '<CMD>tabnext<CR>')
vim.keymap.set({'n', 'i'}, '<C-t><C-r>', '<CMD>tabprevious<CR>')
vim.keymap.set('n', '<C-c>', '<CMD>bp\\<BAR>bd #<CR>')
-- LSP and completion
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition)
--U.map("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>")
--U.map("n", "gr", "<Cmd>Telescope lsp_references<CR>")
vim.keymap.set('n', 'gr', function ()
    return require'telescope.builtin'.lsp_references() end)
vim.keymap.set('n', 'gR', vim.lsp.buf.rename)
vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
--U.map("n", "gw", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
--U.map("n", "gw", "<Cmd>Telescope lsp_code_actions<CR>")
vim.keymap.set('n', 'gw', function ()
    return require'telescope.builtin'.lsp_code_actions() end)
vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next)
-- Old implementation
local function smarttab()
    return vim.fn.pumvisible() and '<C-n>' or '<Tab>'
end
vim.keymap.set('i', '<Tab>', smarttab, { expr = true })
local function rsmarttab()
    return vim.fn.pumvisible() and '<C-p>' or '<S-Tab>'
end
vim.keymap.set('i', '<S-Tab>', rsmarttab, { expr = true })

vim.keymap.set('n', 'gs', '<CMD>Git<CR>')
vim.keymap.set('n', 'gb', '<CMD>BufferLinePick<CR>')
-- IDK Man...
vim.keymap.set({'n', 'i'}, '<C-`>', '<ESC><CMD>vert term<CR>')
vim.keymap.set('n', 'ff', function() return require'telescope.builtin'.git_files() end)
vim.keymap.set('n', 'fg', function() return require'telescope.builtin'.live_grep() end)
-- Old implementation
--U.map("n", "fm", "<Cmd>:Telescope man_pages sections=[v:count?string(v:count):'ALL']<CR>")
vim.keymap.set('n', 'fm', function ()
    require'telescope.builtin'.man_pages({
        -- TODO Check if command count is present and pass that in instead
        sections = {'ALL'}
    })
end)

---- Convenience ----
-- Swap between current and previous buffer
vim.keymap.set('n', '<BS>', '<C-^>')
-- Clear search highlights and error messages
vim.keymap.set('n', '<CR>', '<CMD>nohlsearch<CR><BAR><CMD>echon<CR>')
-- Scroll using ',' and 'm'
vim.keymap.set('n', ',', '<C-y>')
vim.keymap.set('n', 'm', '<C-e>')
-- Cycle tabs with 'H' and 'L'
vim.keymap.set('n', 'H', 'gT')
vim.keymap.set('n', 'L', 'gt')

---- Window Navigation Keybinds ----
-- Terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set({'t', 'i', 'n'}, '<A-h>', '<CMD>wincmd h<CR>')
vim.keymap.set({'t', 'i', 'n'}, '<A-j>', '<CMD>wincmd j<CR>')
vim.keymap.set({'t', 'i', 'n'}, '<A-k>', '<CMD>wincmd k<CR>')
vim.keymap.set({'t', 'i', 'n'}, '<A-l>', '<CMD>wincmd l<CR>')
