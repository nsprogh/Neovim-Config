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

return {
    'akinsho/toggleterm.nvim',
    as = 'terminal',
    config = function ()
        require'toggleterm'.setup {
            size = 80,
            open_mapping = [[<C-\>]],
            insert_mappings = true,
            terminal_mappings = true,
            direction = 'vertical'
        }
    end
}
