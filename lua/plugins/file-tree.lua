return {
    'kyazdani42/nvim-tree.lua',
    cmd = {'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFindFile'},
    -- Uncomment to use icons on status line
    dependencies = {'kyazdani42/nvim-web-devicons'},
    opts = {
        sync_root_with_cwd = true,
        view = {
            width = 40
        },
        git = {
            ignore = true
        },
        renderer = {
            icons = {
                -- show = {
                --     git = false,
                --     folder = false,
                --     file = false,
                --     folder_arrow = true
                -- }
            }
        }
    }
}
