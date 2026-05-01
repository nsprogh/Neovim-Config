vim.pack.add({'https://github.com/ibhagwan/fzf-lua'})

require('fzf-lua').setup({})

vim.keymap.set('n', '<C-x><C-f>',
    function()
        require('fzf-lua').files({
            find_opts = [[-path '*/.*' -prune -o -type f -print]],
            rg_opts   = [[--color=never --files]],
            fd_opts   = [[--color=never --type f --type l --exclude .git]],
            hidden = false,
            previewer = false
        })
    end,
    {desc = 'Find files'})

vim.keymap.set('n', '<C-x><C-r>',
    function() require('fzf-lua').oldfiles() end,
    {desc = 'find recent files'})

vim.keymap.set('n', '<C-/>',
    function() require('fzf-lua').live_grep() end,
    {desc = 'project search'})

vim.keymap.set('n', '<leader>fm',
    function()
        local selected_sections
        if vim.v.count > 0 then
            selected_sections = {tostring(vim.v.count)}
        else
            selected_sections = {'ALL'}
        end

        require('fzf-lua').man_pages({
            sections = selected_sections,
            previewer = false
        })
    end,
    {desc = '[m]an page'})

vim.keymap.set('n', '<C-m>',
    function() require('fzf-lua').diagnostics_document() end,
    {desc = 'diagnostics'})

vim.keymap.set('n', '<A-m>',
    function() require('fzf-lua').diagnostics_workspace() end,
    {desc = 'diagnostics (workspace)'})

vim.keymap.set('n', '<leader>fh',
    function() require('fzf-lua').helptags() end,
    {desc = '[h]elp page'})

vim.keymap.set('n', '<C-x><C-b>',
    function() require('fzf-lua').buffers() end,
    {desc = 'buffer switcher'})

-- Overload default
vim.keymap.set('n', 'grr',
    function() require('fzf-lua').lsp_references() end,
    {desc = 'references (lsp)'})

vim.keymap.set('n', 'gs',
    function() require('fzf-lua').lsp_document_symbols() end,
    {desc = 'document symbols (lsp)'})

-- TODO lsp workspace symbols?
