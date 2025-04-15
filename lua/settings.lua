-- Global options

vim.g.mapleader = ' ' -- spacebar for leader
vim.g.maplocalleader = '\\' -- backslash for local

vim.g.sidebarwidth = 50 -- Custom var for setting the width of sidebars

-- Editor Options
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.ignorecase = true
-- vim.o.encoding = 'UTF-8'
vim.o.updatetime = 1000
-- vim.o.autoread = true
vim.o.ruler = true
vim.o.synmaxcol = 255
-- vim.o.mouse = 'a'
vim.o.undofile = true
-- vim.o.background = 'dark'
-- vim.o.termguicolors = true
--vim.o.cmdheight = 0
vim.o.showmode = false

-- Folds
vim.o.foldenable = true
vim.o.foldtext = ''
vim.o.foldcolumn = '0'
vim.wo.foldminlines = 5

-- Title
vim.o.title = true
vim.o.titlelen = 0
vim.o.titlestring = 'Neovim - %{expand("%:t")}'

-- Window-Local Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.colorcolumn='80'

-- GUI Options
if vim.g.neovide then
    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1

    -- Font selection and size should be handled by config.toml instead
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_transparency = 1
    vim.g.neovide_normal_opacity = 1

    -- Copy
    vim.keymap.set('v', '<C-S-c>', '"+y')
    -- Paste normal/visual mode
    vim.keymap.set({'n', 'v'}, '<C-S-v>', '"+P')
    -- Paste command mode
    vim.keymap.set('c', '<C-S-v>', '<C-R>+')
    -- Paste insert mode
    vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pa')
end

vim.o.completeopt = 'menu,menuone,noselect,popup,fuzzy'
vim.o.pumwidth = 35

-- Diagnostic Settings
-- Currently set to show virtual lines for errors, and virtual text for warn
vim.diagnostic.config({
    virtual_text = {
        enabled = true,
        severity = {
            max = vim.diagnostic.severity.WARN
        }
    },
    virtual_lines = {
        enabled = true,
        current_line = true,
        severity = {
            min = vim.diagnostic.severity.ERROR
        }
    }
})
