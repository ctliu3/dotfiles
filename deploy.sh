#!/usr/local/bin/bash

# Download the submodules
git submodule init
git submodule update

# Setup NeoBundle
# mkdir -p $HOME/.vim/bundle
# git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

cd $HOME

# Make soft links for configs.
declare -A configs=(
  ["zsh/zshrc"]="$HOME/.zshrc"
  ["vim/vimrc"]="$HOME/.vimrc"
  ["tmux/tmux.conf"]="$HOME/.tmux.conf"
)

for source in "${!configs[@]}"; do
  dest=${configs[$source]}
  cp -v $dest $dest.bak
  rm $dest
  ln -s dotfiles/$source $dest
done

# Install fzf
if [ ! -f $file ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

cd -
