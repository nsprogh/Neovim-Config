local command = {}

function command.smart_tab ()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end

function command.smart_tab_rev ()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end

function command.project_files ()
    local opts = {}
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then
        require'telescope.builtin'.find_files(opts)
    end
end

function command.project_grep ()
    require'telescope.builtin'.live_grep()
end

function command.search_man_pages ()
    require'telescope.builtin'.man_pages {
        -- TODO Check if command count is present and pass that in instead
        sections = {'ALL'}
    }
end

function command.lsp_references ()
    require'telescope.builtin'.lsp_references {
        initial_mode = 'normal',
        layout_strategy = 'vertical',
        layout_config = {
            width = 0.5
        },
        trim_text = true
    }
end

return command
