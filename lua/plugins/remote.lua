return {
    'amitds1997/remote-nvim.nvim', version = 'v0.*',
    dependencies = {
        'nvim-lua/plenary.nvim', -- For standard functions
        'MunifTanjim/nui.nvim', -- To build the plugin UI
        'nvim-telescope/telescope.nvim', -- For picking b/w different remote methods
    },
    keys = {
        {'<leader>rs', vim.cmd.RemoteStart, desc = 'Start Remote Session'},
        {'<leader>rc', vim.cmd.RemoteStop, desc = 'Cancel Remote Session'},
        {'<leader>ri', vim.cmd.RemoteInfo, desc = 'Info'},
        {'<leader>rd', vim.cmd.RemoteConfigDel, desc = 'Delete Remote Config'},
        {'<leader>rD', vim.cmd.RemoteCleanup, desc = 'Cleanup Remote'},
        {'<leader>rl', vim.cmd.RemoteLog, desc = 'Remote Logs'}
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
