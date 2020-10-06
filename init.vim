""" Follow XDG directory specs
if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = $HOME.'/.cache'
endif
if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = $HOME.'/.config'
endif

""" Plugin config """
set statusline+=%#warningmsg#
set statusline+=%*

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Ctrl-P
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_dont_split = 'NERD'

" Better Whitespace
let g:strip_whitespace_on_save = 0

" ALE
let g:ale_linters = {
\   'rust': ['analyzer'],
\   'php': ['langserver'],
\   'typescript': ['tsserver', 'eslint'],
\   'latex': ['texlab'],
\}
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_set_balloons = 1

" Lens
let g:lens#animate = 0
let g:lens#disabled_filetypes = ['fzf']

" Unknown
let mapleader = ","

""" Plugins """
" minpac doesn't actually have to be initialized all the time. It is only
" needed when interacting with it (e.g. for updating/installing plugins)
function! PackInit() abort
    packadd minpac

    call minpac#init()
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    call minpac#add('tpope/vim-fugitive')
    call minpac#add('tpope/vim-surround')
    call minpac#add('tpope/vim-endwise')
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')
    "call minpac#add('ctrlpvim/ctrlp.vim')
    call minpac#add('scrooloose/nerdcommenter')
    call minpac#add('altercation/vim-colors-solarized')
    call minpac#add('ntpeters/vim-better-whitespace')
    call minpac#add('leafgarland/typescript-vim')
    call minpac#add('rust-lang/rust.vim')
    call minpac#add('rstacruz/vim-closer')
    call minpac#add('mbbill/undotree')
    call minpac#add('dense-analysis/ale')
    call minpac#add('preservim/tagbar')
    call minpac#add('camspiers/lens.vim')
    call minpac#add('junegunn/fzf', {'do': {-> fzf#install()}})
    call minpac#add('junegunn/fzf.vim')
endfunction

" Define user commands for updating/cleaning the plugins. Each of them calls
" PackInit() to load minpac and register the information of plugins, then
" performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

""" Autocmds """
autocmd! FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd! BufRead,BufNewFile *.volt setfiletype html

""" Editor Configs """
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set backspace=2
set encoding=utf-8
set relativenumber number
set ruler
set colorcolumn=80
set updatetime=1000
set autoread
set synmaxcol=255
set mouse=a
set directory=$XDG_CACHE_HOME/vim/swap//
set backupdir=$XDG_CACHE_HOME/vim/backup//
set undodir=$XDG_CACHE_HOME/vim/undo//
set undofile

""" Style Options """
syntax enable
set background=dark
colorscheme solarized
if has('gui_running')
    highlight SignColumn guibg=#073642
    set signcolumn=yes
    set guifont=Fira\ Code\ 9
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
endif

""" Keybinds """
" Not sure what to bind these to, Alt+Move keys are bound to window navigation
"nnoremap <silent>   <A-j>  :m .+1<CR>==
"nnoremap <silent>   <A-k>  :m .-2<CR>==
"inoremap <silent>   <A-j>  <Esc>:m .+1<CR>==gi
"inoremap <silent>   <A-k>  <Esc>:m .-2<CR>==gi
"vnoremap <silent>   <A-j>  :m '>+1<CR>gv=gv
"vnoremap <silent>   <A-k>  :m '<-2<CR>gv=gv
noremap <silent>    <C-k><C-n>  :Ntree<CR>
noremap <silent>    <C-k><C-u>  :UndotreeToggle<CR>
noremap <silent>    <C-k><C-j>  :TagbarToggle<CR>
nnoremap            <C-tab>     :tabnext<CR>
inoremap            <C-tab>     <Esc>:tabnext<CR>
nnoremap            <C-S-tab>   :tabprevious<CR>
inoremap            <C-S-tab>   <Esc>:tabprevious<CR>
nnoremap <silent>   <C-c>       :bp\|bd #<CR>
nnoremap <silent>   gd          :ALEGoToDefinition<CR>
nnoremap <silent>   gy          :ALEGoToTypeDefinition<CR>
nnoremap <silent>   gr          :ALEFindReferences<CR>
map <silent>        <C-\>       <Plug>NERDCommenterToggle
inoremap <expr>     <Tab>       pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr>     <S-Tab>     pumvisible() ? "\<C-p>" : "\<S-Tab>"
noremap             <C-f>       :Rg 
noremap             <C-p>       :GFiles<CR>
map                 <C-`>       <Esc>:vert term<CR>

""" Terminal Keybinds """
tnoremap <silent>   <Esc>       <C-\><C-n>
tnoremap <silent>   <A-h>       <C-\><C-N><C-w>h
tnoremap <silent>   <A-j>       <C-\><C-N><C-w>j
tnoremap <silent>   <A-k>       <C-\><C-N><C-w>k
tnoremap <silent>   <A-l>       <C-\><C-N><C-w>l
inoremap <silent>   <A-h>       <C-\><C-N><C-w>h
inoremap <silent>   <A-j>       <C-\><C-N><C-w>j
inoremap <silent>   <A-k>       <C-\><C-N><C-w>k
inoremap <silent>   <A-l>       <C-\><C-N><C-w>l
nnoremap <silent>   <A-h>       <C-w>h
nnoremap <silent>   <A-j>       <C-w>j
nnoremap <silent>   <A-k>       <C-w>k
nnoremap <silent>   <A-l>       <C-w>l
