# dotfiles
Here be dotfiles!

## What I use
* zsh
  * [zgenom](https://github.com/jandamm/zgenom) for plugin management
    * [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) for a number of said plugins
    * various others for QoL improvements, which are dynamically activated by detecting which OS you use (out of: WSL Ubuntu, normal Ubuntu, macOS, Arch, Debian?)
* neovim with Lua-forward configuration
  * [packer](https://github.com/wbthomason/packer.nvim) for package management. Highlights include:
    * [this Solarized Dark theme](https://github.com/ishan9299/nvim-solarized-lua)
    * [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    * Edges:
      * [feline](https://github.com/feline-nvim/feline.nvim) for the statusbar
      * [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for the gutter
    * [leap](https://github.com/ggandor/leap.nvim)
* vim
  * [Vundle](https://github.com/VundleVim/Vundle.vim) for plugin management
    * a number of plugins, mostly for QoL improvement and git integration
* [chezmoi](https://github.com/twpayne/chezmoi) for dotfiles management
* [fzf](https://github.com/junegunn/fzf)
* [Solarized Dark](https://ethanschoonover.com/solarized/) theming throughout (you may need to update your terminal emulator's theme & color palettes!)

## Stuff you should run

### Basics
```sh
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply julian45
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install # you can safely say no to the last question, since the sourcing commands are already included 
# run below line only if you've used tarjoilija/zgen before
rm -rf .zgen
```

### neovim-specific

[plugins.lua](dot_config/nvim/lua/plugins.lua) is set up so that upon your first run of `nvim`, it should automatically pull everything down. Once it's done, you'll likely need to quit and reopen for everything (e.g., theme) to properly apply, but after that, everything should be good to go for neovim! 

### vim-specific
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
Then, open a new shell and wait just a bit, and you should be good to go! The above section is partially reconstructed from memory; please let me know if I'm missing something.
