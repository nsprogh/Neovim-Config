-- Treesitter

return {
    'nvim-treesitter/nvim-treesitter',
    name = 'treesitter',
    build = ':TSUpdate',
    dependencies = {
        --'nvim-treesitter/nvim-treesitter-angular',
        {
            -- Treesitter equivalent to context.vim
            'nvim-treesitter/nvim-treesitter-context',
            opts = {
                enable = true,
                max_lines = 5
            }
        },
    },
    -- TODO hardcode the treesitter languages to install and match it to
    -- this list
    cmd = {'TSIntall', 'TSInstallInfo', 'TSUpdate'},
    event = 'BufEnter',
    opts = {
        ensure_installed = {
            'bash',
            'c',
            'typescript',
            'html',
            'markdown',
            'rust',
            'php',
            'java',
            'json',
            'terraform',
            'lua',
            'python',
            'vim',
            'vimdoc',
            'yaml',
            'markdown_inline',
        },
        highlight = {
            enable = true,
            -- add languages not supported by treesitter here
            additional_vim_regex_highlighting = false
        },
        indent = {enable = true},
        autopairs = {enable = false},
    },
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)

        require('nvim-treesitter.install').prefer_git = false

        local groupid = vim.api.nvim_create_augroup('treesitter', { clear = true })

        -- TODO setup tweaks for typescript
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {'typescript', 'json'},
            group = groupid,
            callback = function (args)
                vim.wo.foldmethod = 'expr'
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            end
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'json',
            group = groupid,
            callback = function (args)
                vim.wo.foldlevelstart = 1
            end
        })
    end
}
