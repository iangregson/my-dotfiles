PROMPT='%F{blue}%1~%f %F{green}$%f '
bindkey -v
export TERM=xterm-256color

export EDITOR=vim

# ===============
# Aliases
# ===============

# ssh
alias sshlogin='ssh-add ~/.ssh/id_rsa'

# Some directory listing with colors
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

# trying neovim
alias vi='nvim'
alias vim='nvim'

# ===============
# Environment
# ===============

export PATH="/usr/local/bin:${PATH}"

# load rekener specific config if it exists
[[ -f "$HOME/.rekener-env" ]] && source "$HOME/.rekener-env"

