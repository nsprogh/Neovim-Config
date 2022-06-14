-- Completion plugin
-- nvim-compe is deprecated, use nvim-cmp instead
return {
    'hrsh7th/nvim-compe',
    config = function ()
        require'compe'.setup {
            enabled = true,
            autocomplete = true,

            source = {
                path = true,
                calc = true,
                nvim_lsp = true,
                nvim_lua = false,
                vsnip = false
            }
        }
    end
}
