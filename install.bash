#!/bin/bash

# function config {
#     /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
# }
shopt -s expand_aliases
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/pianocomposer321/dotfiles $HOME/.dotfiles
config checkout || (mv $HOME/.bashrc $HOME/.bashrc~; mv $HOME/.config/init.vim $HOME/.config/init.vim~; mv $HOME/.tmux.conf $HOME/.tmux.conf~; mv $HOME/.tmux $HOME/.tmux~; config checkout)
mkdir -p $HOME/.local/share/nvim/backup
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
config config --local status.showUntrackedFiles no
nvim -u install.lua
