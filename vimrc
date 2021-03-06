set nocompatible              " be iMproved, required
filetype off                  " required

" set t_Co=256
set laststatus=2 " Make the airline show up everywhere
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Stuff from tpope
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-fireplace'
" Plugin 'tpope/vim-salve'

" Linting
" Plugin 'vim-syntastic/syntastic'
" Plugin 'w0rp/ale'

" Themes
Plugin 'altercation/vim-colors-solarized'

" NERD plugins
Plugin 'scrooloose/nerdtree'
Plugin 'commentToggle'

" Airline and associated plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

" Others
Plugin 'rust-lang/rust.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'venantius/vim-eastwood'
Plugin 'dodie/vim-disapprove-deep-indentation'
Plugin 'chr4/sslsecure.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_yaml_checkers = ['yamllint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Keyboard mappings
inoremap jk <ESC>
let mapleader=','
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap ; :
set backspace=indent,eol,start

filetype plugin indent on
filetype plugin on
syntax enable
set number
set background=dark
colorscheme solarized
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" let g:rehash256 = 1
if system('uname -s') == "Darwin\n"
	" macOS
	let g:gitgutter_git_executable = '/usr/local/bin/git'
else
	" Ubuntu
	let g:gitgutter_git_executable = '/usr/bin/git'
endif
