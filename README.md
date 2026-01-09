# dotfiles
Here be dotfiles!

## What I use
* zsh
  * [zimfw AKA the Zim framework](https://zimfw.sh/) for fast & efficient plugin management
    * [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) for a number of said plugins
    * various others for QoL improvements, which are dynamically activated by detecting which OS you use (out of: WSL Ubuntu, normal Ubuntu, macOS, Arch, Fedora, RHEL + similar, Debian?)
* neovim with Lua-forward configuration
  * [lazy.nvim](https://lazy.folke.io/) for package management. Highlights include:
    * [this Solarized Dark theme](https://github.com/ishan9299/nvim-solarized-lua)
    * [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    * Edges:
      * [feline](https://github.com/feline-nvim/feline.nvim) for the statusbar
      * [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for the gutter
* vim
  * [vim-plug](https://github.com/junegunn/vim-plug) for plugin management
    * a number of plugins, mostly for QoL improvement and git integration
* [chezmoi](https://github.com/twpayne/chezmoi) for dotfiles management
* [fzf](https://github.com/junegunn/fzf)
* [Solarized Dark](https://ethanschoonover.com/solarized/) theming throughout (you may need to update your terminal emulator's theme & color palettes!)

## Stuff you should run

### Basics
```sh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply julian45
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install # you can safely say no to the last question, since the sourcing commands are already included 
```

### zsh-specific
Upon your first use of zsh after dotfiles installation, the Zim Framework will bootstrap itself and download all necessary plugins. From that point onward, the various [zimfw commands](https://zimfw.sh/docs/commands/#zimfw) can be used to grab plugin updates, install new plugins if you changed your zimrc, update your local copy of the Zim Framework, etc.

### neovim-specific
[plugins.lua](dot_config/nvim/lua/plugins.lua) is set up so that upon your first run of `nvim`, it should automatically pull everything down. Once it's done, you'll likely need to quit and reopen for everything (e.g., theme) to properly apply, but after that, everything should be good to go for neovim! 

### vim-specific
[the vimrc](dot_vimrc) is set up such that it will automatically bootstrap vim-plug and the specified plugins upon the first time you start vim after dotfile installation. It may initially complain about the solarized theme not being present, but this is expected and will go away after vim-plug is done working.
