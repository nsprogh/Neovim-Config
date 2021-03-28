local U = {}

function U.map(mode, key, result, options)
    local defaults = {
        noremap = true,
        silent = true,
        expr = false
    }

    options = vim.tbl_extend("keep", options or {}, defaults)
    vim.api.nvim_set_keymap(mode, key, result, options)
end

return U
