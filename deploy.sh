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

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd -
