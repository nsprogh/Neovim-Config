local function project_files()
    local opts = {}
    local ok = pcall(require('telescope.builtin').git_files, opts)
    if not ok then
        require('telescope.builtin').find_files(opts)
    end
end

local function recent_files()
    require('telescope.builtin').oldfiles()
end

local function project_grep()
    require('telescope.builtin').live_grep()
end

local function search_man_pages()
    local selected_sections
    if vim.v.count > 0 then
        local count_string = tostring(vim.v.count)
        selected_sections = {count_string}
    else
        selected_sections = {'ALL'}
    end

    require('telescope.builtin').man_pages({
        sections = selected_sections
    })
end

local function search_help()
    require('telescope.builtin').help_tags()
end

local function project_open()
    require('telescope').extensions.project.project()
end

local function goto_buffer()
    require('telescope.builtin').buffers()
end

local function goto_references()
    require('telescope.builtin').lsp_references({
        initial_mode = 'normal',
        layout_strategy = 'vertical',
        layout_config = {
            width = 0.5
        },
        trim_text = true
    })
end

return {
    'nvim-telescope/telescope.nvim', version = 'v0.*',
    keys = {
        {'<leader>ff', project_files, desc = 'Find Files'},
        {'<leader>fr', recent_files, desc = 'Find Recent Files'},
        {'<leader>fg', project_grep, desc = 'Find Pattern'},
        {'<leader>fm', search_man_pages, desc = 'Find Man Page'},
        {'<leader>fh', search_help, desc = 'Find Help Page'},
        {'<leader>fp', project_open, desc = 'Find Project'},

        {'<leader>gb', goto_buffer, desc = 'Goto Buffer'},
        {'<leader>gr', goto_references, desc = 'Goto References'}
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-project.nvim'
    },
    config = function ()
        local actions = require('telescope.actions')
        require('telescope').setup {
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
                    require('telescope.themes').get_cursor()
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

        require('telescope').load_extension('ui-select')
    end
}
