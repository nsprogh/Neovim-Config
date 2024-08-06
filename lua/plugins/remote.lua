return {
   'amitds1997/remote-nvim.nvim',
   version = '*', -- Pin to GitHub releases
   dependencies = {
       'nvim-lua/plenary.nvim', -- For standard functions
       'MunifTanjim/nui.nvim', -- To build the plugin UI
       'nvim-telescope/telescope.nvim', -- For picking b/w different remote methods
   },
   cmd = {'RemoteStart', 'RemoteStop', 'RemoteInfo', 'RemoteCleanup', 'RemoteConfigDel', 'RemoteLog'},
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
