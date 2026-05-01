-- Treesitter

---Table of filetype => parsers assocations. If no key is specified then the
---ft and parser are assumed to be the same. Parsers can be a single value or
---a table of values that are merged into the final set of parsers.
local filetypes = {
    'bash',
    'c',
    typescript = {'typescript', 'jsdoc'},
    javascript = {'javascript', 'jsdoc'},
    'css',
    'html',
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
    'nu',
    markdown = {'markdown', 'markdown_inline'}
}

local fts = {}
local parsers = {}
for ft, parser in pairs(filetypes) do
    if type(ft) == 'string' then
        table.insert(fts, ft)
    else
        table.insert(fts, parser)
    end

    if type(parser) == 'table' then
        for _, item in ipairs(parser) do
            table.insert(parsers, item)
        end
    else
        table.insert(parsers, parser)
    end
end

return {
    'nvim-treesitter/nvim-treesitter', branch = 'master',
    name = 'treesitter',
    build = ':TSUpdate',
    dependencies = {
        {
            -- Treesitter equivalent to context.vim
            'nvim-treesitter/nvim-treesitter-context', branch = 'master',
            opts = {
                enable = true,
                max_lines = 5
            }
        },
    },
    cmd = {'TSIntall', 'TSInstallInfo', 'TSUpdate'},
    ft = fts,
    opts = {
        ensure_installed = parsers,
        highlight = {
            enable = true,
            -- add languages not supported by treesitter here
            additional_vim_regex_highlighting = false
        },
        indent = {enable = true},
        autopairs = {enable = false},
        incremental_selection = {
            enable = true,
            keymaps = {
                node_incremental = 'v',
                node_decremental = 'V'
            }
        }
    },
    config = function (_, opts)
        require('nvim-treesitter.configs').setup(opts)

        require('nvim-treesitter.install').prefer_git = false

        local groupid = vim.api.nvim_create_augroup('treesitter', { clear = true })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = {'typescript', 'json'},
            group = groupid,
            callback = function (args)
                local window = vim.api.nvim_get_current_win()

                vim.wo[window][0].foldmethod = 'expr'
                vim.wo[window][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            end
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'json',
            group = groupid,
            callback = function (args)
                vim.wo.foldlevel = 1
            end
        })
    end
}
