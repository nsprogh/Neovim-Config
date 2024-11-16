-- Configuration for the tab bar

-- Disabled currently as functionality will be handled by lualine
return {
    'akinsho/nvim-bufferline.lua',
    -- Uncomment to use icons
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        options = {
            view = 'multiwindow',
            numbers = 'none',
            show_buffer_icons = false,
            show_buffer_close_icons = false,
            show_buffer_default_icon = false,
            show_close_icon = false,
            max_name_length = 28,
            diagnostics = 'nvim_lsp',
            groups = {items = {
                {
                    name = 'Tests',
                    matcher = function (buffer)
                        return buffer.filename:match('%.spec')
                    end
                }
            }}
        },
    }
}
