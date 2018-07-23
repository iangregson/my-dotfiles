# ===============
# ZSH
# ===============

export ZSH=$HOME/.oh-my-zsh
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status node_version time)
THEME=${THEME:=powerlevel9k/powerlevel9k}
if [[ $THEME = "bullet" ]]
then
  THEME="bullet-train"
fi
if [[ $THEME = "plain" ]]
then
  THEME="robbyrussell"
fi
ZSH_THEME=$THEME


# ===============
# Colors
# ===============
TERM=xterm-256color
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


# ===============
# Plugins
# ===============
plugins=(git git-extras emoji node yarn npm)
source $ZSH/oh-my-zsh.sh
PROMPT="$PROMPT$emoji[skull]  "


# ===============
# Other rcs
# ===============
source ~/.bashrc


# ===============
# Aliases
# ===============

# git
alias ga='git add . -A '
alias gs='git status '
alias gpull='git pull '
alias gco='git checkout '
alias gob='git checkout -b '
alias gc='git commit -am '
alias gb='git branch '
alias gp='git push --set-upstream origin $(git symbolic-ref -q HEAD)'
alias gm='git merge '
alias new-repo='open https://github.com/new'
# Postgres
alias start-postgres='pg_ctl -D ~/PostgreSQL/data/pg95 start'
alias stop-postgres='pg_ctl -D ~/PostgreSQL/data/pg95 stop'
# Docker compose
alias dc='docker-compose '
alias de='docker-compose exec '
alias dcdev='dc -f docker-compose.dev.yml '
# Rekener
alias rek='cd ~/Rekener/app/node'
alias acq='cd ~/Sites/devdesktop/rekenersite-dev'
alias app='yarn start'
# ssh
alias ssh-login='ssh-add ~/.ssh/id_rsa'
# misc
alias serve='python -m SimpleHTTPServer'
alias start='npm start'
alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'
alias plain='THEME=plain zsh'
alias bullet='THEME=bullet zsh'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias checkport='lsof -i '
# incase i forget how to clear
alias c='clear'
alias k='clear'
alias cls='clear'
alias clr='clear '
# Some directory listing with colors
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
# because I'm to lazy to write vim
alias v='vim'
alias minivim='vim -u ~/my-dotfiles/.minvimrc'
alias s="sudo"
# Desktop Programs
alias safari="open -a safari"
alias chrome="open -a google\ chrome"
alias f='open -a Finder '
alias fh='open -a Finder .'
alias slack="open -a '/Applications/Slack.app'"
alias macdown="open -a '/Applications/MacDown.app'"
alias trello="open -a '/Applications/Trello.app'"
# Notepad & logbook
alias notepad="vim ~/Dropbox/notes/Buffer"
function lb() {
    vim ~/logbook/$(date '+%Y-%m-%d').md
}

# ===============
# Environment
# ===============

export PATH="/usr/local/bin:${PATH}"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# yarn
export PATH="$PATH:`yarn global bin`"
export PATH="$HOME/.yarn/bin:$PATH"

# go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# ZSH completions
fpath=(/usr/local/share/zsh-completions $fpath)

# AWS completions
source /usr/local/bin/aws_zsh_completer.sh

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/iangregson/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/iangregson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/iangregson/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/iangregson/google-cloud-sdk/completion.zsh.inc'; fi
# aws
export PATH=$PATH:~/.local/bin
