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

function command.recent_files ()
    require'telescope.builtin'.oldfiles()
end

function command.project_grep ()
    require'telescope.builtin'.live_grep()
end

function command.project_open ()
    require'telescope'.extensions.project.project()
end

function command.search_man_pages ()
    local selected_sections
    if vim.v.count > 0 then
        local count_string = tostring(vim.v.count)
        selected_sections = {count_string}
    else
        selected_sections = {'ALL'}
    end

    require'telescope.builtin'.man_pages {
        sections = selected_sections
    }
end

function command.search_help ()
    require'telescope.builtin'.help_tags()
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

function command.goto_buffer ()
    require'telescope.builtin'.buffers()
end

function command.quickfix ()
    vim.lsp.buf.code_action({
        only = {'quickfix'},
        apply = true
    })
end

return command
