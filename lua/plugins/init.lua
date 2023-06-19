function string:endswith(pattern)
    local start = -1 * pattern:len()

    return self:sub(start) == pattern
end

-- Load all plugin modules
local plugins = {}
local pluginfiles = vim.api.nvim_get_runtime_file('lua/plugins/*.lua', true)
for _, filepath in ipairs(pluginfiles) do
    -- Except init.lua (this file) or disabled modules (! suffix)
    if filepath:endswith('init.lua') or filepath:endswith('!') then
        goto continue
    end

    local module = dofile(filepath)
    table.insert(plugins, module)

    ::continue::
end


-- TODO Plugins to try out
-- - Hydra https://github.com/anuvyklack/hydra.nvim
-- - GitSigns https://github.com/lewis6991/gitsigns.nvim
-- - Workspaces https://github.com/natecraddock/workspaces.nvim
--   - Also see how this integrates into Telescope Project
-- - UFO (better code folding) https://github.com/kevinhwang91/nvim-ufo

local function get_packer()
    if package.loaded['packer'] then
        return
    end

    vim.cmd('packadd packer.nvim')

    local packer = require'packer'
    packer.startup(function (use)
        use {'wbthomason/packer.nvim', opt = true}

        for _, plugin in ipairs(plugins) do
            use(plugin)
        end

        -- Load all plugin modules
        --local pluginfiles = vim.api.nvim_get_runtime_file('lua/plugins/*.lua', true)
        --for _, filepath in ipairs(pluginfiles) do
        --    -- Except init.lua (this file) or disabled modules (! suffix)
        --    if filepath:endswith('init.lua') or filepath:endswith('!') then
        --        goto continue
        --    end

        --    local module = dofile(filepath)
        --    if type(module) == 'function' then
        --        module(use)
        --    else
        --        use(module)
        --    end

        --    ::continue::
        --end
    end)

    return packer
end

-- Setup packer commands to lazy-init packer itself

local function packer_sync()
    get_packer().sync()
end
vim.api.nvim_create_user_command('PackerSync', packer_sync, {})

local function packer_install()
    get_packer().install()
end
vim.api.nvim_create_user_command('PackerInstall', packer_install, {})

local function packer_compile()
    get_packer().compile()
end
vim.api.nvim_create_user_command('PackerCompile', packer_compile, {})

local function packer_status()
    get_packer().status()
end
vim.api.nvim_create_user_command('PackerStatus', packer_status, {})
