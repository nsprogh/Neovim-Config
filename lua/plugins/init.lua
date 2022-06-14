-- Only required if you have packer in your `opt` pack
vim.cmd [[ packadd packer.nvim ]]

local function endswith(source, pattern)
    local start = -1 * source:len()

    return source:sub(start) == pattern
end

-- Automatically run :PackerCompile whenever plugins.lua is updated with an
-- autocommand
-- vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

-- Doesn't seem to do anything?
--vim.api.nvim_create_autocmd('BufWritePost', {
--    pattern = 'plugins.lua',
--    callback = function ()
--        require'packer'.compile()
--    end
--})

require'packer'.startup(function (use)
    use {'wbthomason/packer.nvim', {opt = true}}

    -- Git client
    use 'tpope/vim-fugitive'

    -- Surround text with brackets/parens/quotes/etc.
    use 'tpope/vim-surround'

    -- Load all plugin modules
    local pluginfiles = vim.api.nvim_get_runtime_file('lua/plugins/*.lua', true)
    for filepath in pluginfiles do
        -- Except init.lua (this file) or disabled modules (! suffix)
        if endswith(filepath, '/init.lua') or endswith(filepath, '!') then
            goto continue
        end

        print(vim.inspect(filepath))

        local module = require(filepath)
        use(module)

        ::continue::
    end
end)
