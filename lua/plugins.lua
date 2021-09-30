-- Only required if you have packer in your `opt` pack
vim.cmd [[ packadd packer.nvim ]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an
-- autocommand
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

-- TODO this doesn't need to be loaded every time, figure out how to hook into
-- install and update commands
return require("packer").startup(function(use)
    use {"wbthomason/packer.nvim", opt = true}

    -- Git client
    use "tpope/vim-fugitive"

    -- Surround text with brackets/parens/quotes/etc.
    use "tpope/vim-surround"

    -- Auto close blocks. Endwise is for languges with text based block
    -- delimiters like Bash (if/fi) and Ruby (if/endif). Closer is for standard
    -- braces and other symbol-based block delimiters.
    --use "tpope/vim-endwise"
    use "rstacruz/vim-closer"
    -- This works but is ever so slightly perceptible slow compared to
    -- vim-closer. I'll try this out later.
    --use {
    --    "windwp/nvim-autopairs",
    --    config = function ()
    --        require("nvim-autopairs").setup {
    --            check_ts = true
    --        }

    --        require("nvim-autopairs.completion.compe").setup {
    --            map_cr = true,
    --            map_complete = false
    --        }
    --    end
    --}

    -- Status line and tab line
    --use "vim-airline/vim-airline"
    --use "vim-airline/vim-airline-themes"
    use {
        "hoob3rt/lualine.nvim",
        -- Uncomment to use icons on status line
        --requires = {"kyazdani42/nvim-web-devicons", opt = true}
        config = function ()
            require("lualine").setup{
                options = {
                    -- Auto works nice and all but the dedicated solarized theme
                    -- works a bit better I think. I'll try it out and see. Try
                    -- switching to "solarized_dark" in a bit.
                    theme = "solarized_dark",
                    section_separators = "",
                    component_separators = "|",
                    icons_enabled = false
                },
                extensions = {'nvim-tree', 'fugitive'}
            }
        end
    }
    use {
        "akinsho/nvim-bufferline.lua",
        -- Uncomment to use icons
        --requires = {"kyazdani42/nvim-web-devicons"},
        config = function ()
            require("bufferline").setup{
                options = {
                    view = "multiwindow",
                    numbers = "none",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    diagnostics = "nvim_lsp"
                }
            }
        end
    }

    -- File browser
    use {
        "kyazdani42/nvim-tree.lua",
        -- Uncomment to use icons on status line
        --requires = {"kyazdani42/nvim-web-devicons"},
        config = function ()
            require("nvim-tree").setup{
                view = {
                    width = 40
                }
            }
        end
    }

    -- Fuzzy finder
    -- use "ctrlpvim/ctrlp.vim"
    use {
        "nvim-telescope/telescope.nvim",
        -- Has a weird bug right now with lazy loading
        --opt = true,
        --cmd = {"Telescope"},
        requires = {{"nvim-lua/plenary.nvim"}},
        config = function ()
            local actions = require("telescope.actions")
            require("telescope").setup{
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close
                        }
                    }
                },
                pickers = {
                    find_files = {
                        previewer = false,
                        theme = "ivy"
                    },
                    git_files = {
                        previewer = false,
                        theme = "ivy"
                    },
                    live_grep = {
                        theme = "dropdown"
                    },
                    man_pages = {
                        previewer = false,
                        theme = "ivy"
                    },
                    lsp_references = {
                        previewer = false,
                        theme = "ivy",
                        initial_mode = "normal"
                    },
                    lsp_code_actions = {
                        previewer = false,
                        theme = "cursor",
                        initial_mode = "normal"
                    }
                }
            }
        end
    }

    -- Autocommenter
    --use "scrooloose/nerdcommenter"
    --use "tomtom/tcomment_vim"
    use "tpope/vim-commentary"
    -- This integrates with commentary and updates commentstring as
    -- needed when in polyglot filetypes (e.g. TSX or HTML files)
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Solarized Color Scheme
    --use "altercation/vim-colors-solarized"
    --use "lifepillar/vim-solarized8"
    use "romainl/flattened"

    -- Trailing whitespace nagger
    use "ntpeters/vim-better-whitespace"

    -- Language specific plugins
    -- Perhaps these are not needed anymore with TreeSitter?
    --use {"leafgarland/typescript-vim", opt = true, ft = {"typescript"}}
    --use {"rust-lang/rust.vim", opt = true, ft = {"rust"}}

    -- Undo tree side-panel
    use {"mbbill/undotree", opt = true, cmd = {"UndotreeToggle"}}

    -- Tags side-panel
    use {"preservim/tagbar", opt = true, cmd = {"TagbarToggle"}}

    -- Indent guides
    --use "lukas-reineke/indent-blankline.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            require("nvim-treesitter.configs").setup {
                highlight = {enable = true},
                indent = {enable = false},
                autopairs = {enable = false},
                context_commentstring = {enable = true}
            }
        end
    }

    -- LSP and autocompletion
    --use "dense-analysis/ale"
    use {
        "neovim/nvim-lspconfig",
        config = function ()
            require("lspconfig").rust_analyzer.setup{}
            require("lspconfig").intelephense.setup{}
            require("lspconfig").tsserver.setup{}
            require("lspconfig").texlab.setup{}
            require("lspconfig").ccls.setup{}
        end
    }
    use {
        "hrsh7th/nvim-compe",
        config = function ()
            require("compe").setup {
                enabled = true;
                autocomplete = true;

                source = {
                    path = true;
                    buffer = true;
                    calc = true;
                    nvim_lsp = true;
                    nvim_lua = false;
                    vsnip = false;
                }
            }
        end
    }
    -- use {
    --   'weilbith/nvim-code-action-menu',
    --   opt = true,
    --   cmd = 'CodeActionMenu'
    -- }
end)
