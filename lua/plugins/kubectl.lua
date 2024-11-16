local function toggle()
    -- TODO set this up to open in a new tab
    require('kubectl').toggle()
end

return {
    'ramilito/kubectl.nvim',
    keys = {
        {'<Leader>kk', toggle, desc = 'Kubernetes'}
    },
    opts = {}
}
