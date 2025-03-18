local command = {}

function command.next_error_global()
    local dlist = vim.diagnostic.get(nil, {severity = {vim.diagnostic.severity.ERROR}})
    if #dlist == 0 then
        return
    end

    local current_buffer = vim.api.nvim_get_current_buf()
    local target_index = 1
    local found_next = false
    for i, value in ipairs(dlist) do
        if value.bufnr == current_buffer then
            found_next = true
            goto continue
        end

        if found_next then
            target_index = i
            break
        end

        ::continue::
    end

    local diagnostic = dlist[target_index]
    vim.api.nvim_set_current_buf(diagnostic.bufnr)
    vim.api.nvim_win_set_cursor(0, { diagnostic.end_lnum + 1, diagnostic.end_col })
end

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

-- TODO Figure out how to switch the path better since `.spec.ts` doesn't quite
-- expand correctly and can cause issues when trying to switch to the other
-- corresponding files from the unit test file
function command.angular_goto_component ()
    local target = vim.fn.expand("%:r")..'.ts'

    vim.cmd('edit '..target)
end

function command.angular_goto_template ()
    local target = vim.fn.expand("%:r")..'.html'

    vim.cmd('edit '..target)
end

function command.angular_goto_style ()
    local base = vim.fn.expand('%:r')

    local target = base..'.css'
    if vim.fn.filereadable(target) == 0 then
        target = base..'.scss'
    end

    vim.cmd('edit '..target)
end

function command.angular_goto_spec ()
    local target = vim.fn.expand("%:r")..'.spec.ts'

    vim.cmd('edit '..target)
end

return command
