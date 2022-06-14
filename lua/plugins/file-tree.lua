return {
    "kyazdani42/nvim-tree.lua",
    opt = true,
    cmd = {'NvimTreeToggle', 'NvimTreeOpen'},
    -- Uncomment to use icons on status line
    --requires = {"kyazdani42/nvim-web-devicons"},
    config = function ()
        require("nvim-tree").setup{
            view = {
                width = 40
            },
            git = {
                ignore = true
            },
            renderer = {
                icons = {
                    show = {
                        git = false,
                        folder = false,
                        file = false,
                        folder_arrow = true
                    }
                }
            }
        }
    end
}
