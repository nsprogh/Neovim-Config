return {
    'folke/which-key.nvim',
    config = function ()
        local commands = require'commands'

        vim.o.timeout = true
        vim.o.timeoutlen = 500
        require'which-key'.setup {
            plugins = {
                spelling = {
                    suggestions = 8
                },
                presets = {
                    g = false
                }
            }
        }

        local options = {
            mode = 'n',
            prefix = '<leader>',
            silent = true,
            noremap = true,
        }
        local mappings = {
            c = {
                name = 'Clear',
                c = {'<cmd>nohlsearch<cr><bar><cmd>echon<cr>', 'messages'}
            },
            f = {
                name = 'Find',
                f = {commands.project_files, 'Files'},
                r = {commands.recent_files, 'Recent File'},
                g = {commands.project_grep, 'Word'},
                m = {commands.search_man_pages, 'Man Page'},
                h = {commands.search_help, 'Help Page'},
                p = {commands.project_open, 'Project'}
            },
            k = {
                name = 'Sidebars',
                n = {'<cmd>NvimTreeToggle<cr>', 'File Tree'},
                m = {'<cmd>NvimTreeFindFile<cr>', 'Show Current Buffer in File Tree'},
                u = {'<cmd>UndotreeToggle<cr>', 'Undo Tree'},
                j = {'<cmd>TagbarToggle<cr>', 'Tags'},
                o = {'<cmd>vertical Git<cr>', 'Git'},
                e = {'<cmd>TroubleToggle document_diagnostics<cr>', 'Document Errors'}
            },
            l = {
                name = 'Lsp',
                e = {vim.diagnostic.open_float, 'Messages'},
                w = {vim.lsp.buf.code_action, 'Code Actions'},
                r = {vim.lsp.buf.rename, 'Rename Symbol'},
                q = {commands.quickfix, 'Quick Fix'},
                i = {'<cmd>LspInfo<cr>', 'LSP Info'}
            },
            t = {
                name = 'Terminals',
                a = {commands.toggle_all_terminals, 'Show/Hide Terminals'}
                -- TODO setup shortcuts for each of like 10 terminals or
                -- something like that
            },
            m = {
                name = 'Miscellaneous',
                p = {
                    name = 'Packer',
                    s = {'<cmd>PackerSync<cr>', 'Sync'},
                    c = {'<cmd>PackerCompile<cr>', 'Compile'},
                }
            }
        }
        require'which-key'.register(mappings, options)
    end
}
