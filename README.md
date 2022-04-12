# dotfiles
Here be dotfiles!

## What I use
* zsh
  * [zgenom](https://github.com/jandamm/zgenom) for plugin management
    * [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) for a number of said plugins
    * various others for QoL improvements, which are dynamically activated by detecting which OS you use (out of: WSL Ubuntu, normal Ubuntu, macOS, Arch, Debian?)
* vim
  * [Vundle](https://github.com/VundleVim/Vundle.vim) for plugin management
    * a number of plugins, mostly for QoL improvement and git integration
* [chezmoi](https://github.com/twpayne/chezmoi) for dotfiles management
* [fzf](https://github.com/junegunn/fzf)
* [Solarized Dark](https://ethanschoonover.com/solarized/) theming throughout (you may need to update your terminal emulator's theme & color palettes!)

## Stuff you should run
```
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply julian45
vim +PluginInstall +qall
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install # you can safely say no to the last question, as the sourcing commands are already included 
# run below line only if you've used tarjoilija/zgen before
rm -rf .zgen
```
Then, open a new shell and wait just a bit, and you should be good to go! The above section is partially reconstructed from memory; please let me know if I'm missing something.
