local g = vim.g
local go = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd

-- Command-like Options
cmd("filetype plugin indent on")
cmd("colorscheme flattened_dark")

-- Editor Options
go.tabstop = 4
go.softtabstop = 0
go.shiftwidth = 4
go.expandtab = true
go.smarttab = true
go.smartindent = true
go.ignorecase = true
go.backspace = "2"
go.encoding = "UTF-8"
go.updatetime = 1000
go.autoread = true
go.ruler = true
go.synmaxcol = 255
go.mouse = "a"
go.undofile = true
go.background = "dark"
go.termguicolors = true
go.completeopt = "menuone,noselect"
go.splitbelow = true

-- Window-Local Options
wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.colorcolumn="80"

---- Global Variables ----
g.mapleader = ","

-- Airline
g.airline_theme = "base16"
g.airline = {
    extensions = {
        tabline = { enabled = 1, formatter = "unique_tail" },
        ale = { enabled = 1 },
    }
}

-- Ctrl-P
g.ctrlp_working_path_mode = "ra"
g.ctrlp_user_command = {".git/", "git --git-dir=%s/.git ls-files -oc --exclude-standard"}
g.ctrlp_dont_split = "NERD"

-- Better Whitespace
g.strip_whitespace_on_save = 1

-- ALE
g.ale_linters = {
    rust = {"analyzer"},
    php = {"intelephense"},
    typescript = {"tsserver", "eslint"},
    latex = {"texlab"},
    c = {"ccls", "gcc"}
}
g.ale_completion_enabled = 1
g.ale_completion_autoimport = 1
g.ale_set_balloons = 1

-- Nvim Tree
-- g.nvim_tree_width = 40
g.nvim_tree_show_icons = {
    git = 0,
    folders = 0,
    files = 0,
    folder_arrows = 1
}
