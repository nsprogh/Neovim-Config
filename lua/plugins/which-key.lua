local function show()
    require('which-key').show({ global = false })
end

return {
    'folke/which-key.nvim', version = 'v3.*',
    event = 'VeryLazy',
    keys = {
        {'<Leader>?', show, desc = 'Buffer Local Keymaps (which-key)'}
    },
    opts = {
        icons = {
            mappings = false
        },
        plugins = {
            presets = {
                g = false,
                operators = false,
                motions = false,
                windows = false,
                nav = false,
                text_objects = true,
            },
            marks = false,
            registers = false,
            spelling = false
        }
    },
    init = function ()
        vim.go.timeout = true
        vim.go.timeoutlen = 500
    end,
    config = function (_, opts)
        require('which-key').setup(opts)
        require('which-key').add({
            {'<leader>c', group = 'Clear'},
            {'<leader>f', group = 'Find'},
            {'<leader>k', group = 'Sidebar'},
            {'<leader>l', group = 'LSP'},
            {'<leader>t', group = 'Terminal'},
            {'<leader>m', group = 'Miscellaneous'},
            {'<leader>r', group = 'Remote Session'},
            {'<leader>g', group = 'Goto'},
            {'<leader>G', group = 'Git'},
            {'<leader>o', group = 'Tasks'}
        })
    end
}
