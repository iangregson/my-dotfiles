export PS1="\W $ "
set -o vi
export TERM=xterm-256color

# ===============
# Aliases
# ===============

# ssh
alias ssh-login='ssh-add ~/.ssh/id_rsa'

# incase i forget how to clear
alias k='clear'

# Some directory listing with colors
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

# Logbook
function lb() {
    vim ~/logbook/$(date '+%Y-%m-%d').md
}

# ===============
# Environment
# ===============

export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# aws
export PATH="~/Library/Python/3.7/bin:${PATH}"
