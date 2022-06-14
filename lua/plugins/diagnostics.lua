-- Diagnostics summary
return {
  'folke/trouble.nvim',
  -- Uncomment to enable icons
  --requires = 'kyazdani42/nvim-web-devicons',
  cmd = {'Trouble', 'TroubleToggle'},
  config = function()
    require'trouble'.setup {
        icons = false,
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
        use_diagnostic_signs = false
    }
  end
}
