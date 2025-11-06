vim.filetype.add({
    extension = { volt = 'html' }
})

vim.filetype.add({
    filename = { ['.env'] = 'dosini' },
    pattern = { ['%.env-.*'] = 'dosini' }
})
