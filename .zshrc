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
alias go='git checkout '
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
# Rekener
alias rek='cd ~/Rekener/app/node'
alias acq='cd ~/Sites/devdesktop/rekenersite-dev'
alias app='yarn start'
# ssh
alias ssh-login='ssh-add ~/.ssh/id_rsa'
# misc
alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'
alias plain='THEME=plain zsh'
alias bullet='THEME=bullet zsh'
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
alias v='nvim'
alias s="sudo"
# Desktop Programs
alias safari="open -a safari"
alias chrome="open -a google\ chrome"
alias f='open -a Finder '
alias fh='open -a Finder .'
alias slack="open -a '/Applications/Slack.app'"
alias macdown="open -a '/Applications/MacDown.app'"
alias trello="open -a '/Applications/Trello.app'"


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

# ZSH completions
fpath=(/usr/local/share/zsh-completions $fpath)
