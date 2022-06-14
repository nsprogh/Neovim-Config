-- Only required if you have packer in your `opt` pack
vim.cmd [[ packadd packer.nvim ]]

function string:endswith(pattern)
    local start = -1 * pattern:len()

    return self:sub(start) == pattern
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

    -- Load all plugin modules
    local pluginfiles = vim.api.nvim_get_runtime_file('lua/plugins/*.lua', true)
    for _, filepath in ipairs(pluginfiles) do
        -- Except init.lua (this file) or disabled modules (! suffix)
        if filepath:endswith('/init.lua') or filepath:endswith('!') then
            goto continue
        end

        local module = dofile(filepath)
        if type(module) == 'function' then
            module(use)
        else
            use(module)
        end

        ::continue::
    end
end)
