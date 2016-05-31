export PYTHONPATH=
export LC_ALL=en_US.UTF-8

function safe_export_path() {
  [[ -d $1 ]] && export PATH=$1:$PATH
}
function safe_source() {
  [[ -s $1 ]] && source $1
}

# sys env
export ARCHFLAGS="-arch x86_64"

# zsh env
ZSH=$HOME/dotfiles/.oh-my-zsh
ZSH_THEME="candy" # $ZSH/themes/
ZSH_CUSTOM=$ZSH/custom
plugins=(git d autojump zsh-autosuggestions zsh-syntax-highlighting)
safe_source $ZSH/oh-my-zsh.sh

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && \
  source $HOME/.autojump/etc/profile.d/autojump.sh

safe_source $HOME/dotfiles/.zshrc.local

# other config
export VISUAL=vim
export EDITOR=$VISUAL
