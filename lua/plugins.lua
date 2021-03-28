-- Only required if you have packer in your `opt` pack
vim.cmd [[ packadd packer.nvim ]]

-- Automatically run :PackerCompile whenever plugins.lua is updated with an
-- autocommand
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

-- TODO this doesn't need to be loaded every time, figure out how to hook into
-- install and update commands
return require("packer").startup(function(use)
    use {"wbthomason/packer.nvim", opt = true}

    use "tpope/vim-fugitive"
    use "tpope/vim-surround"
    use "tpope/vim-endwise"
    use "rstacruz/vim-closer"
    -- For status line and tabline
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
                    theme = "auto",
                    section_separators = "",
                    component_separators = "|",
                    icons_enabled = false
                }
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
                    numbers = "none",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    diagnostics = "nvim_lsp"
                }
            }
        end
    }

    -- Fuzzy finder
    use "ctrlpvim/ctrlp.vim"
    --use {
        --"nvim-telescope/telescope.nvim",
        --requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    --}

    -- Autocommenter
    --use "scrooloose/nerdcommenter"
    use "tomtom/tcomment_vim"

    -- Solarized Color Scheme
    --use "altercation/vim-colors-solarized"
    --use "lifepillar/vim-solarized8"
    use "romainl/flattened"

    use "ntpeters/vim-better-whitespace"
    use {"leafgarland/typescript-vim", opt = true, ft = {"typescript"}}
    use {"rust-lang/rust.vim", opt = true, ft = {"rust"}}
    use {"mbbill/undotree", opt = true, cmd = {"UndotreeToggle"}}
    use {"preservim/tagbar", opt = true, cmd = {"TagbarToggle"}}

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
end)
