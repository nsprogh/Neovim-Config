return {
    'stevearc/overseer.nvim', version = 'v1.*',
    keys = {
        {'<leader>Tr', function () vim.cmd.OverseerRun() end,
            desc = 'Run Task'},
        {'<leader>Ta', function () vim.cmd.OverseerTaskAction() end,
            desc = 'Task Actions'},
        {'<leader>kt', function () require('overseer').toggle({ enter = false}) end,
            desc = 'Toggle Overseer Panel'}
    },
    opts = {
        task_list = {
            direction = "left"
        }
    }
}
