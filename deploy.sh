# cat << EOT >> test
# set -g status-bg green
# unbind C-q
# set -g prefix C-a
# bind C-a send-prefix
# EOT

cd $HOME

all_rc=(.zshrc .vimrc)

for rc in {$all_rc[@]};
do
  if [[ -f $rc ]]; then
    cp -v $rc $rc.bak
    rm $rc
    ln -s dotfiles/$rc $rc
  fi
done

github=https://github.com
# download .oh-my-zsh
[[ ! -d .oh-my-zsh ]] && git clone $github/robbyrussell/oh-my-zsh.git .oh-my-zsh

# download plugins for tmux
tmux_plugins=(tpm tmux-copycat tmux-resurrect tmux-yank)
for plugin in ${tmux_plugins[@]};
do
  dest=~/dotfiles/.tmux/plugins/$plugin
  [[ -d $dest ]] && rm -dfr $dest && git clone $github/tmux-plugins/$plugin $dest
done

# download plugins for zsh
plugin_dir=$HOME/dotfiles/.oh-my-zsh/custom/plugins
[ ! -d $plugin_dir/zsh-autosuggestions ] \
  && git clone $github/zsh-users/zsh-autosuggestions.git $plugin_dir/zsh-autosuggestions
[ ! -d $plugin_dir/zsh-syntax-highlighting ] \
  && git clone $github/zsh-users/zsh-syntax-highlighting.git $plugin_dir/zsh-syntax-highlighting

cd -
