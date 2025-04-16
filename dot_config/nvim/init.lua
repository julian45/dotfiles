-- set some main options
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

-- map leader and localleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- map ; as a shortcut to : for running commands
vim.keymap.set("n", ";", ":")
-- load in the plugins we require from lua/plugins.lua
require('plugins')

-- set colorscheme
vim.cmd([[colorscheme solarized]])
-- try to prevent nvim from overriding terminal cursor format (again)
vim.opt.guicursor = ""
-- workaround some broken plugins which set guicursor indiscriminately
-- (thanks, neovim FAQ!)
vim.cmd([[autocmd OptionSet guicursor noautocmd set guicursor=]])

-- configuration for Neovide (https://neovide.dev) if present
if vim.fn.exists("g:neovide") then
    vim.opt.guifont = "Inconsolata_Nerd_Font,Monaco,Noto_Color_Emoji:h12"
end

-- if PowerShell 7 is available, configure tree-sitter-powershell
if vim.fn.executable("pwsh") == 1 then
    require("_tree-sitter-powershell")
end

-- configure lspconfig
require("_lspconfig")