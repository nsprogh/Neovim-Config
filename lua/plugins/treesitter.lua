vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' }
})

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

require('nvim-treesitter').install(parsers)

local groupid = vim.api.nvim_create_augroup('plugins.treesitter', { clear = true })
vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Update treesitter parsers on update',
    group = groupid,
    callback = function (event)
        local name, kind = event.data.spec.name, event.data.spec.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            vim.cmd.TSUpdate()
        end
    end
})

vim.api.nvim_create_autocmd('FileType', {
    desc = 'Enable treesitter highlighting',
    group = groupid,
    pattern = fts,
    callback = function ()
        -- Highlighting
        vim.treesitter.start()
        -- Experimental indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
})

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
