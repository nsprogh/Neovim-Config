return function (use)
    -- Autocommenter
    --use 'scrooloose/nerdcommenter'
    --use 'tomtom/tcomment_vim'
    use 'tpope/vim-commentary'

    -- This integrates with commentary and updates commentstring as
    -- needed when in polyglot filetypes (e.g. TSX or HTML files)
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = {
            'nvim-treesitter/nvim-treesitter-context',
            'tpope/vim-commentary'
        }
    }
end
