-- return {
--     'akinsho/toggleterm.nvim',
--     as = 'terminal',
--     config = function ()
--         require'toggleterm'.setup {
--             size = 80,
--             direction = 'vertical',
--             open_mapping = '<C-\\>',
--             insert_mapping = '<C-\\>'
--         }
--     end
-- }

function toggle()
    require'toggleterm'.toggle(vim.v.count)
end

function toggle_all()
    require'toggleterm'.toggle_all()
end

-- Setup keybinds externally to lazy load the rest of the module
-- vim.keymap.set({'n', 'i', 't'}, '<C-\\>', toggle)
-- vim.keymap.set({'n', 'i', 't'}, '<A-\\>', toggle_all)

-- vim.api.nvim_create_autocmd('TermEnter', {
--     pattern = 'term://*toggleterm#*',
--     callback = function ()
--         vim.keymap.set('t', '<C-\\>', toggle) 
--     end
-- })

return {
    'akinsho/toggleterm.nvim',
    name = 'terminal',
    keys = {
        {'<C-\\>', toggle, mode = {'n', 'i', 't'}},
        {'<A-\\>', toggle_all, mode = {'n', 'i', 't'}}
    },
    opts = {
        size = 80,
        open_mapping = nil,
        direction = 'vertical'
    }
}
