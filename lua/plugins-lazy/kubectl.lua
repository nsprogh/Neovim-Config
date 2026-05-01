local function toggle()
    -- TODO set this up to open in a new tab
    require('kubectl').toggle({ tab = true })
end

return {
    'ramilito/kubectl.nvim', version = 'v1.*',
    keys = {
        {'<Leader>kk', toggle, desc = 'Kubernetes'}
    },
    opts = {}
}
