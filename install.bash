#!/bin/bash

# function config {
#     /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
# }
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/pianocomposer321/dotfiles $HOME/.dotfiles
config checkout || (mv $HOME/.bashrc $HOME/.bashrc~; mv $HOME/.config/init.vim $HOME/.config/init.vim~; mv $HOME/.tmux.conf $HOME/.tmux.conf~; mv $HOME/.tmux $HOME/.tmux~; config checkout)
mkdir $HOME/.local/share/nvim/backup
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
config checkout
config config --local status.showUntrackedFiles no
nvim +PlugInstall +qall
