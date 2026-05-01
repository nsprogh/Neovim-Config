local function toggle()
    require('toggleterm').toggle(vim.v.count)
end

local function toggle_all()
    require('toggleterm').toggle_all()
end

-- vim.api.nvim_create_autocmd('TermEnter', {
--     pattern = 'term://*toggleterm#*',
--     callback = function ()
--         vim.keymap.set('t', '<C-\\>', toggle) 
--     end
-- })

return {
    'akinsho/toggleterm.nvim', tag = 'v2.13.0',
    name = 'terminal',
    keys = {
        {'<C-\\>', toggle, mode = {'n', 'i', 't'}},
        {'<A-\\>', toggle_all, mode = {'n', 'i', 't'}}
    },
    opts = {
        -- size = 80,
        open_mapping = nil,
        -- direction = 'vertical'
    }
}
