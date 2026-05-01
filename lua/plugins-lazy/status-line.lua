-- Configuration for a status line

return {
    'hoob3rt/lualine.nvim', branch = 'master',
    -- Uncomment to use icons on status line
    dependencies = {'nvim-tree/nvim-web-devicons'},
    lazy = false,
    opts = {
        options = {
            theme = 'kanagawa',
            -- section_separators = '',
            -- component_separators = '|',
            -- icons_enabled = false
        },
        sections = {
            lualine_b = {
                {
                    function ()
                        return vim.g.remote_neovim_host and ("Remote: %s"):format(vim.uv.os_gethostname()) or ""
                    end,
                    padding = { right = 1, left = 1 }
                }
            },
            lualine_x = {
                {'encoding', icons_enabled = false},
                {'fileformat', icons_enabled = false},
                {'filetype', icons_enabled = false},
            }
        },
        tabline = {
            lualine_a = {
                {'buffers',
                    mode = 4, -- 0: Shows buffer name
                              -- 1: Shows buffer index
                              -- 2: Shows buffer name + buffer index
                              -- 3: Shows buffer number
                              -- 4: Shows buffer name + buffer number
                    buffers_color = {
                        active = 'lualine_a_normal',
                        inactive = 'lualine_c_normal'
                    },
                    symbols = {
                        modified = ' +',
                        alternate_file = '# '
                    }
                }
            },
            lualine_z = {'tabs'}
        },
        extensions = {
            'nvim-tree',
            'fugitive',
            'toggleterm',
            'man'
        }
    },
}
