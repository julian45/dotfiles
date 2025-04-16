-- set statement time
vim.opt.showmatch = true -- show matching brackets
vim.opt.ignorecase = true -- case insensitive matching
vim.opt.mouse = "v" -- middle-click paste with mouse
vim.opt.number = true -- add line numbers
vim.opt.wildmode = "longest,list" -- get bash-like tab completion
vim.opt.cc = "88" -- set color columns for good coding style
vim.opt.tabstop = 4 -- number of columns supplied by a tab character by default
vim.opt.expandtab = true -- convert tabs to whitespace
vim.opt.shiftwidth = 4 -- width for autoindents
vim.opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.termguicolors = true
vim.opt.guicursor = ""

vim.cmd([[
" get all the plugins we need from lua/plugins.lua
lua require('plugins')

" color scheme settings
syntax enable
colorscheme solarized

" mappings/remappings
let g:mapleader = ','
nnoremap ; :

" prevent nvim from overriding terminal cursor format
set guicursor=
"" workaround some broken plugins which set guicursor indiscriminately
"" (thanks, nvim FAQ!)
autocmd OptionSet guicursor noautocmd set guicursor=

" configuration for Neovide (https://neovide.dev)
if exists("g:neovide")
    set guifont=Inconsolata_Nerd_Font,Monaco,Noto_Color_Emoji:h12
endif

if executable('pwsh')
    lua require('_tree-sitter-powershell')
endif

lua require('_lspconfig')
]])
