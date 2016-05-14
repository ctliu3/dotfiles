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
plugins=(git d zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Go path
export GOROOT=/usr/local/go
export GOPATH=$HOME/Allblue/Codes/gospace

# PATH
safe_export_path /usr/bin:/usr/local/bin:/bin:/usr/local/sbin/
safe_export_path $HOME/bin
safe_export_path $GOPATH/bin
safe_export_path $HOME/Library/Haskell/bin
safe_export_path /usr/local/opt/scala/bin
safe_export_path $HOME/Allblue/Tools/activator
# Added by the Heroku Toolbelt
safe_export_path /usr/local/heroku/bin
safe_export_path $HOME/.rvm/bin
safe_export_path "/Applications/Racket v6.2.1/bin"

safe_source $HOME/dotfiles/.zsh/alias.zsh

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Other config
export VISUAL=vim
