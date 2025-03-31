require 'settings'
require 'packagemanager'
require 'autocommands'
require 'keybinds'

vim.api.nvim_create_user_command(
    'Browse',
    function (options)
        vim.system({ 'xdg-open', options.fargs[1] })
    end,
    { nargs = 1 }
)
