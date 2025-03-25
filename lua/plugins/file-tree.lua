return {
    'kyazdani42/nvim-tree.lua', version = 'v1.*',
    keys = {
        {'<leader>kn', function () vim.cmd.NvimTreeToggle() end, desc = 'File Tree'},
        {'<leader>km', function () vim.cmd.NvimTreeFindFile() end, desc = 'Show Current Buffer in File Tree'}
    },
    -- Uncomment to use icons on status line
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        sync_root_with_cwd = true,
        actions = {
            open_file = {
                quit_on_open = true
            }
        },
        view = {
            width = vim.g.sidebarwidth
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
    },
    init = function ()
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end
}
