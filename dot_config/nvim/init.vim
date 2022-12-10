" big ole block of set statements
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=88                   " set colour columns for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " convert tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set termguicolors

" get all the plugins we need from lua/plugins.lua
lua require('plugins')

" color scheme settings
syntax enable
colorscheme solarized

" mappings/remappings
let g:mapleader = ','
nnoremap ; :

" configuration for Neovide (https://neovide.dev)
if exists("g:neovide")
    set guifont=Inconsolata_Nerd_Font,Monaco,Noto_Color_Emoji:h12
endif
