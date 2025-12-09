return {
    'amitds1997/remote-nvim.nvim', version = 'v0.*',
    dependencies = {
        {'nvim-lua/plenary.nvim', version = 'v0.*'}, -- For standard functions
        'MunifTanjim/nui.nvim', -- To build the plugin UI
        'nvim-telescope/telescope.nvim', -- For picking b/w different remote methods
    },
    keys = {
        {'<leader>rs', function () vim.cmd.RemoteStart() end, desc = 'Start Remote Session'},
        {'<leader>rc', function () vim.cmd.RemoteStop() end, desc = 'Cancel Remote Session'},
        {'<leader>ri', function () vim.cmd.RemoteInfo() end, desc = 'Info'},
        {'<leader>rd', function () vim.cmd.RemoteConfigDel() end, desc = 'Delete Remote Config'},
        {'<leader>rD', function () vim.cmd.RemoteCleanup() end, desc = 'Cleanup Remote'},
        {'<leader>rl', function () vim.cmd.RemoteLog() end, desc = 'Remote Logs'}
    },
    opts = {
        client_callback = function (port, workspace_config)
             local cmd = ('alacritty -e nvim --server localhost:%s --remote-ui'):format(port)
             vim.fn.jobstart(cmd, {
                 detach = true,
                 on_exit  = function (job_id, exit_code, event_type)
                     print('Client', job_id, 'exited with code', exit_code, 'Event type:', event_type)
                 end
             })
        end
    },
}
