-- Configuration for the tab bar

return {
    'akinsho/nvim-bufferline.lua',
    -- Uncomment to use icons
    --requires = {'kyazdani42/nvim-web-devicons'},
    after = 'colorscheme',
    config = function ()
        require'bufferline'.setup{
            options = {
                view = 'multiwindow',
                numbers = 'none',
                show_buffer_close_icons = false,
                show_close_icon = false,
                diagnostics = 'nvim_lsp'
            }
        }
    end
}
