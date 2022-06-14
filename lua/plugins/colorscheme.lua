-- Solarized Color Scheme
--return 'altercation/vim-colors-solarized'
--return 'lifepillar/vim-solarized8'
-- Lightweight version
--return 'romainl/flattened'

-- Nord Color Scheme
-- Lots of features supported by this one
return {
    'shaunsingh/nord.nvim',
    as = 'colorscheme',
    config = function ()
        -- Color Setup
        vim.g.nord_contrast = true
        vim.g.nord_borders = true
        vim.g.nord_disable_background = true
        vim.g.nord_italics = true
        require'nord'.set()
    end
}
