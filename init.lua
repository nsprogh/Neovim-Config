require('settings')
require('filetypes')
require('autocommands')
require('keybinds')

-- Load all plugin modules
local pluginfiles = vim.api.nvim_get_runtime_file('lua/plugins/*.lua', true)
for _, filepath in ipairs(pluginfiles) do
    dofile(filepath)
end

vim.api.nvim_create_user_command(
    'Browse',
    function (options)
        vim.system({ 'xdg-open', options.fargs[1] })
    end,
    { nargs = 1 }
)
