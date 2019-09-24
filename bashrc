export PS1="\W $ "

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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# aws
export PATH=$PATH:~/.local/bin

# Postgres
alias start-postgres='pg_ctl -D ~/PostgreSQL/data/pg95 start'
alias stop-postgres='pg_ctl -D ~/PostgreSQL/data/pg95 stop'
export PATH="$PATH:$HOME/PostgreSQL/pg95/bin"
export PGDATA="$HOME/PostgreSQL/data/pg95"
