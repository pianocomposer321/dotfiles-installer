#!/bin/bash

function config {
    /usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME
}

echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/pianocomposer321/dotfiles-installer
config checkout || (mv .bashrc .bashrc~; mv .config/init.vim .config/init.vim~; mv .tmux.conf .tmux.conf~; mv .tmux .tmux~)
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
config checkout
config config --local status.showUntrackedFiles no
nvim +PlugInstall +qall
