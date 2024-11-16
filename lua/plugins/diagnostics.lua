-- Diagnostics summary
local function toggle()
    return vim.cmd.TroubleToggle('document_diagnostics')
end

return {
    'folke/trouble.nvim', version = 'v3.*',
    name = 'diagnostics',
    -- Uncomment to enable icons
    dependencies = {'nvim-tree/nvim-web-devicons'},
    keys = {
        {'<leader>ke', toggle, desc = 'Document Errors'}
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
