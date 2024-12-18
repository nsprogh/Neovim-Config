-- Diagnostics summary
local function toggle_buffer()
    return vim.cmd.Trouble('diagnostics', 'toggle', 'filter.buf=0')
end

local function toggle_all()
    return vim.cmd.Trouble('diagnostics', 'toggle')
end

return {
    'folke/trouble.nvim', version = 'v3.*',
    name = 'diagnostics',
    -- Uncomment to enable icons
    dependencies = {'nvim-tree/nvim-web-devicons'},
    cmd = 'Trouble',
    keys = {
        {'<leader>ke', toggle_buffer, desc = 'Buffer Errors'},
        {'<leader>kE', toggle_all, desc = 'All Errors'}
    },
    opts = {
        icons = true,
        -- icon used for open folds
        --fold_open = 'v',
        -- icon used for closed folds
        --fold_closed = '>',
        -- add an indent guide below the fold icons
        indent_lines = false,
        signs = {
            -- icons / text used for a diagnostic
            error = 'error',
            warning = 'warn',
            hint = 'hint',
            information = 'info'
        },
        -- enabling this will use the signs defined in your lsp client
        use_diagnostic_signs = true
    }
}
