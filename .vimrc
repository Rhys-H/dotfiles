" General
set lazyredraw

" UI
set number
set ruler
set showmatch
syntax on

" Editor
set autoindent
set smartindent
set smarttab
set expandtab
set textwidth=100
set backspace=indent,eol,start
filetype plugin indent on

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Python
autocmd FileType python setlocal ts=4 sts=4 sw=4

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
