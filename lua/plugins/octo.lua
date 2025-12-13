return {
    'pwntester/octo.nvim', branch = 'master',
    cmd = 'Octo',
    opts = {
        -- or 'fzf-lua' or 'snacks' or 'default'
        picker = 'fzf-lua',
        -- bare Octo command opens picker of commands
        enable_builtin = true,
    },
    keys = {
        -- {
        --     '<leader>GI',
        --     '<cmd>Octo issue list<cr>',
        --     desc = '[G]ithub [I]ssue list',
        -- },
        {
            '<leader>GR',
            '<cmd>Octo pr list<cr>',
            desc = '[G]ithub pull [R]equests',
        },
        -- {
        --     '<leader>Gd',
        --     '<cmd>Octo discussion list<cr>',
        --     desc = 'List GitHub Discussions',
        -- },
        {
            '<leader>GN',
            '<cmd>Octo notification list<cr>',
            desc = '[G]ithub [N]otification list',
        },
        {
            '<leader>GS',
            function()
                require('octo.utils').create_base_search_command({
                    include_current_repo = true
                })
            end,
            desc = '[G]ithub [S]earch',
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'ibhagwan/fzf-lua',
        -- OR 'nvim-telescope/telescope.nvim',
        -- OR 'folke/snacks.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function (_, opts)
        require('octo').setup(opts)

        vim.treesitter.language.register('markdown', 'octo')
    end
}
