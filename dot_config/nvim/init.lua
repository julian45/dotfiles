require("config.options") -- this might not need to be called by default, let's see
require("config.keymaps")

require("config.lazy")

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

-- configure lspconfig
require("_lspconfig")
