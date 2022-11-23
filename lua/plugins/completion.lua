-- Completion plugin
-- nvim-compe is deprecated, use nvim-cmp instead
-- return {
--     'hrsh7th/nvim-compe',
--     config = function ()
--         require'compe'.setup {
--             enabled = true,
--             autocomplete = true,

--             source = {
--                 path = true,
--                 calc = true,
--                 nvim_lsp = true,
--                 nvim_lua = false,
--                 vsnip = false
--             }
--         }
--     end
-- }

local function has_words_before ()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function map_select_next (fallback)
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        fallback()
    end
end

local function map_select_prev (fallback)
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end

-- Successor to nvim-compe
-- TODO setup in a way that is a bit more modular, so that we can load it even
-- if lsp isn't loaded yet
return function (use)
    use {
        'hrsh7th/nvim-cmp',
        as = 'completion',
        requires = {
            {'hrsh7th/cmp-buffer', after = 'completion'},
            {'hrsh7th/cmp-path', after = 'completion'},
            {'hrsh7th/cmp-cmdline', after = 'completion'},
            {'hrsh7th/cmp-nvim-lsp-signature-help',
                after = {'lsp', 'completion'}},
            {'saadparwaiz1/cmp_luasnip',
                after = 'completion',
                requires = 'l3mon4d3/luasnip'}
        },
        after = {
            'lsp',
            'luasnip'
        },
        config = function ()
            vim.o.completeopt = 'menu,menuone,noselect'

            local luasnip = require 'luasnip'
            local cmp = require 'cmp'
            cmp.setup {
                performance = {
                    throttle = 500
                },
                view = {
                    entries = 'native'
                },
                snippet = {
                    expand = function (args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },
                window = {
                  -- completion = cmp.config.window.bordered(),
                  -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping(map_select_next, {'i', 's'}),
                    ['<S-Tab>'] = cmp.mapping(map_select_prev, {'i', 's'})
                },
                sources = {
                    {name = 'nvim_lsp', group_index = 1},
                    {name = 'nvim_lsp_signature_help', group_index = 1},
                    {name = 'luasnip', group_index = 1},
                    -- Don't show buffer completion if the others are available
                    -- **Since we aren't loading nvim-cmp until lsp is loaded and
                    -- lsp only loads on supported file types, the buffer
                    -- completion will likely never happen. But in case lsp is good
                    -- but the server isn't working then I guess this works as a
                    -- fallback in that rare case**
                    {name = 'buffer', group_index = 2}
                }
            }
        end
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        after = {'lsp', 'completion'},
        config = function ()
            -- Setup lspconfig.
            local capabilities = require'cmp_nvim_lsp'
                .default_capabilities(vim.lsp.protocol.make_client_capabilities())
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            require'lspconfig'.tsserver.setup {capabilities = capabilities}
        end
    }
end
