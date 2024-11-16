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

return {
    'liuchengxu/vista.vim',
    name = 'tagbar',
    keys = {
        {'<Leader>kj', '<cmd>Vista nvim_lsp<cr>', desc = 'Tags (LSP)'}
    }
}
