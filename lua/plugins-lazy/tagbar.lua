-- Tags side-panel

-- Old
--return {
--    'preservim/tagbar',
--    cmd = {'TagbarToggle', 'TagbarOpen'}
--}

-- Neovim based, a little too controlling over folds
--local function show()
--    require('aerial').open()
--end
--
--return {
--    'stevearc/aerial.nvim',
--    keys = {
--        {'<Leader>kj', show, desc = 'Tagbar'}
--    },
--    opts = {
--        lazy_load = false,
--        manage_folds = true
--    },
--    -- Optional dependencies
--    dependencies = {
--        'treesitter',
--        'nvim-tree/nvim-web-devicons'
--    }
--}

local function toggle()
    return vim.cmd.Vista('nvim_lsp')
end

return {
    'liuchengxu/vista.vim', branch = 'master',
    name = 'tagbar',
    keys = {
        {'<Leader>kj', toggle, desc = 'Tags (LSP)'}
    },
    init = function ()
        vim.g.vista_sidebar_width = vim.g.sidebarwidth
    end
}
