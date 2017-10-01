" Plugins -------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --all'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'mileszs/ack.vim'
Plug 'othree/html5.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
Plug 'hashivim/vim-terraform'

call plug#end()

" Settings ------------------------------
let mapleader=","

if !has('nvim')
    set nocompatible
    filetype off
    filetype plugin indent on

    set ttyfast
    set ttymouse=xterm2
    set ttyscroll=3

    set laststatus=2
    set encoding=utf-8
    set autoread
    set autoindent
    set backspace=indent,eol,start
    set hlsearch
    set mouse=a

    syntax enable
    set t_Co=256
    set term=ansi
endif

" Gui
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=T
if has("gui_running")
    set linespace=2
endif

" Defaults
let g:ackprg = 'ag --vimgrep'
set number
set showcmd
set noswapfile
set nobackup
set splitright
set splitbelow
set autowrite
set hidden
set fileformats=unix,dos,mac
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshowmode
set completeopt=menu,menuone
set nocursorcolumn
set nocursorline
set colorcolumn=80
set updatetime=400
set pumheight=10
set clipboard^=unnamed
set clipboard^=unnamedplus
set viminfo='200
set lazyredraw
set list listchars=tab:▸\ ,trail:·,eol:¬,precedes:←,extends:→
set background=dark
colorscheme gruvbox

" Mappings
nnoremap <leader><space> :nohlsearch<CR>    " Turn off search highlights
nnoremap <leader>o :only<CR>                " Close all other windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>g :Ack 
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :bp\|bd #<CR>            " Close buffer unless last
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>


" File types
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.js setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=0
autocmd BufNewFile,BufRead *.tmpl setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=0
autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=0
autocmd BufNewFile,BufRead *.less setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=0
autocmd BufNewFile,BufRead *.css setlocal expandtab tabstop=4 shiftwidth=2 softtabstop=0

" Quickfix
nnoremap <leader>a :cclose<CR>
map <C-n> :cn<CR>zz
map <C-p> :cp<CR>zz

" CtrlP
map <Leader>j :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 1
let g:ctrlp_map = '<c-f>'
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_buftag_types = {
            \ 'go'       : '--language-force=go --golang-types=ftv',
            \ }
nmap <C-d> :CtrlPBufTag<CR>

" VimGo
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 0
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>f <Plug>(go-def)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>l :GoLint<CR>
au FileType go nmap <Leader>p :GoPlay<CR>

" DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" NerdTree
nmap <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=34

" Lightline
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightlineFugitive',
            \   'readonly': 'LightlineReadonly',
            \   'modified': 'LightlineModified'
            \ }
            \ }

function! LightlineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightlineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "§"
    else
        return ""
    endif
endfunction

function! LightlineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" BufTabLine
set hidden
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprev<CR>

