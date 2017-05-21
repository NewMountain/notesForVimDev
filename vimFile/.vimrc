call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'lsdr/monokai'
call plug#end()
 
" Sane defaults for me
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set number
set noswapfile
set ignorecase
 
" Give NERDTree the gift of sight
let NERDTreeShowHidden=1
 
" Syntastic config for Python
let g:syntastic_python_checkers=['pep8', 'pyflakes', 'pylint', 'pydocstyle']
 
" Syntastic config for syntastic in general
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
 
 
" Make the colors not suck
" Try gruvbox
set background=dark
"let g:gruvbox_italic=1
"let g:gruvbox_termcolors=16
"colorscheme gruvbox
 
" Try molokai
" let g:molokai_original=1
"colorscheme molokai
 
" Try monokai
"colorscheme monokai

