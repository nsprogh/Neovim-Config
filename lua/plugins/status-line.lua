-- Configuration for a status line

return {
    "hoob3rt/lualine.nvim",
    -- Uncomment to use icons on status line
    --requires = {"kyazdani42/nvim-web-devicons", opt = true}
    after = 'colorscheme',
    config = function ()
        require'lualine'.setup{
            options = {
                theme = 'nord',
                section_separators = '',
                component_separators = '|',
                icons_enabled = false
            },
            extensions = {'nvim-tree', 'fugitive'}
        }
    end
}
