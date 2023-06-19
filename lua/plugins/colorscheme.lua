-- Solarized Color Scheme
--return 'altercation/vim-colors-solarized'
--return 'lifepillar/vim-solarized8'
-- Lightweight version
-- return { 'romainl/flattened', as = 'colorscheme' }

-- Nord Color Scheme
-- Lots of features supported by this one
return {
    'shaunsingh/nord.nvim',
    as = 'colorscheme',
    config = function ()
        -- Color Setup
        vim.g.nord_contrast = true
        vim.g.nord_borders = true
        vim.g.nord_disable_background = false
        vim.g.nord_italics = true
        require'nord'.set()
    end
}

-- A little weird right now
-- return {
--     'Tsuzat/NeoSolarized.nvim',
--     as = 'colorscheme',
--     config = function ()
--         require'NeoSolarized'.setup {
--             style = 'dark',
--             transparent = false,
--             terminal_colors = true, -- ?
--             enable_italics = true
--         }

--         vim.cmd[[colorscheme NeoSolarized]]
--     end
-- }
