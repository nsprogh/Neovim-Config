local U = require "utils"

U.map("n", "<C-k><C-n>", "<Cmd>Ntree<CR>")
U.map("n", "<C-k><C-u>", "<Cmd>UndotreeToggle<CR>")
U.map("n", "<C-k><C-j>", "<Cmd>TagbarToggle<CR>")
-- Doesn't work for some reason. Something to do with how vim handles the shift
-- key
--U.map("n", "<C-T><C-T>", "<Cmd>tabnew<CR>")
--U.map("i", "<C-T><C-T>", "<Esc><Cmd>tabnew<CR>")
U.map("n", "<C-t><C-t>", "<Cmd>tabnext<CR>")
U.map("i", "<C-t><C-t>", "<Esc><Cmd>tabnext<CR>")
U.map("n", "<C-t><C-r>", "<Cmd>tabprevious<CR>")
U.map("i", "<C-t><C-r>", "<Esc><Cmd>tabprevious<CR>")
U.map("n", "<C-c>", "<Cmd>bp\\|bd #<CR>")
-- LSP and completion
U.map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
U.map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
U.map("n", "gy", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
U.map("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>")
U.map("n", "gR", "<Cmd>lua vim.lsp.buf.rename()<CR>")
U.map("n", "ge", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
U.map("n", "gw", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
U.map("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
U.map("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
U.map("i", "<Tab>", "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"", { expr = true })
U.map("i", "<S-Tab>", "pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"", { expr = true })
U.map("n", "gs", "<Cmd>Gstatus<CR>")
U.map("n", "gb", "<Cmd>BufferLinePick<CR>")
-- Associated with tcomment_vim plugin
--U.map("", "<C-\\>", "<Esc><Cmd>TComment<CR>")
-- Associated with vim-commentary plugin
--U.map("", "<C-\\>", "<Esc><Cmd>Commentary<CR>")
-- Goes along with another plugin not used anymore
--U.map("n", "<C-f>", ":Rg ", { silent = false })
U.map("", "<C-`>", "<Esc><Cmd>vert term<CR>")

---- Window Navigation Keybinds ----
-- Terminal
U.map("t", "<Esc>", "<C-\\><C-n>")
U.map("t", "<A-h>", "<C-\\><C-n><C-w>h")
U.map("t", "<A-j>", "<C-\\><C-n><C-w>j")
U.map("t", "<A-k>", "<C-\\><C-n><C-w>k")
U.map("t", "<A-l>", "<C-\\><C-n><C-w>l")

-- Insert
U.map("i", "<A-h>", "<C-w>h")
U.map("i", "<A-j>", "<C-w>j")
U.map("i", "<A-k>", "<C-w>k")
U.map("i", "<A-l>", "<C-w>l")

-- Normal
U.map("n", "<A-h>", "<C-w>h")
U.map("n", "<A-j>", "<C-w>j")
U.map("n", "<A-k>", "<C-w>k")
U.map("n", "<A-l>", "<C-w>l")

