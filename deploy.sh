# cat << EOT >> test
# set -g status-bg green
# unbind C-q
# set -g prefix C-a
# bind C-a send-prefix
# EOT

cd $HOME

all_rc=(.zshrc .vimrc)

for rc in $all_rc;
do
  if [[ -f $rc ]]; then
    cp -v $rc $rc.bak
    rm $rc
    ln -s dotfiles/$rc $rc
  fi
done


plugin_dir=$HOME/dotfiles/.oh-my-zsh/custom/plugins
github=https://github.com
[ ! -d $plugin_dir/zsh-autosuggestions ] \
  && git clone $github/zsh-users/zsh-autosuggestions.git $plugin_dir/zsh-autosuggestions
[ ! -d $plugin_dir/zsh-syntax-highlighting ] \
  && git clone $github/zsh-users/zsh-syntax-highlighting.git $plugin_dir/zsh-syntax-highlighting

cd -
