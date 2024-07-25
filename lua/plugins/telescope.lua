return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-project.nvim'
    },
    config = function ()
        local actions = require'telescope.actions'
        require'telescope'.setup {
            defaults = {
                mappings = {
                    i = {
                        ['<esc>'] = actions.close
                    }
                }
            },
            pickers = {
                buffers = {
                    previewer = false,
                    theme = 'dropdown'
                },
                find_files = {
                    previewer = false,
                    theme = 'ivy'
                },
                git_files = {
                    previewer = false,
                    theme = 'ivy'
                },
                man_pages = {
                    previewer = false,
                    theme = 'ivy'
                },
                lsp_references = {
                    initial_mode = 'normal'
                },
                help_tags = {
                    mappings = {
                        i = {
                            ['<cr>'] = actions.file_vsplit
                        }
                    }
                }
            },
            extensions = {
                ['ui-select'] = {
                    require'telescope.themes'.get_cursor()
                },
                project = {
                    base_dirs = {
                        {'~/Documents/projects', max_depth = 2}
                    }
                }
            }
        }
        -- EXTENSIONS --
        -- Extensions not explicitly loaded here, will be lazy-loaded

        require'telescope'.load_extension('ui-select')
    end
}
