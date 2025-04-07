return {
    'stevearc/overseer.nvim',
    keys = {
        {'<leader>or', function () vim.cmd.OverseerRun() end, desc = 'Run Task'},
        {'<leader>oa', function () vim.cmd.OverseerTaskAction() end, desc = 'Task Actions'},
        {'<leader>kt', function () vim.cmd.OverseerToggle() end, desc = 'Toggle Overseer Panel'}
    },
    opts = {}
}
