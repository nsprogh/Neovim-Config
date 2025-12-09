local function files()
    require('fzf-lua').files({
        find_opts = [[-path '*/.*' -prune -o -type f -print]],
        rg_opts   = [[--color=never --files]],
        fd_opts   = [[--color=never --type f --type l --exclude .git]],
        hidden = false
    })
end

-- TODO figure out how to quiet this command when not a git repository
local function project_files()
    local handle = require('fzf-lua').git_files()
    if not handle then
        files()
    end
end

local function recent_files()
    require('fzf-lua').oldfiles()
end

local function project_grep()
    require('fzf-lua').live_grep()
end

local function man_pages()
    local selected_sections
    if vim.v.count > 0 then
        selected_sections = {tostring(vim.v.count)}
    else
        selected_sections = {'ALL'}
    end

    require('fzf-lua').man_pages({ sections = selected_sections })
end

return {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {'<leader>ff', files,
            desc = '[f]iles'},
        {'<leader>fF', files,
            desc = '[F]iles (force scan)'},
        {'<leader>fr', recent_files,
            desc = '[r]ecent files'},
        {'<leader>fg', project_grep,
            desc = '[g]rep pattern'},
        {'<leader>fm', man_pages,
            desc = '[m]an page'},
        {'<leader>fd', function() require('fzf-lua').diagnostics_document() end,
            desc = '[d]iagnostics'},
        {'<leader>fD', function() require('fzf-lua').diagnostics_workspace() end,
            desc = '[D]iagnostics (workspace)'},
        {'<leader>fh', function() require('fzf-lua').helptags() end,
            desc = '[h]elp page'},
        {'<leader>fb', function() require('fzf-lua').buffers() end,
            desc = '[b]uffers'},
        {'<leader>fr', function() require('fzf-lua').lsp_references() end,
            desc = '[r]eferences (LSP)'}
    },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    opts = {}
}
