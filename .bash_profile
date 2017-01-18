# Terminal Colors
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls="ls -la"

# Add /usr/local/bin and sbin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Postgres app
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Vim (from Brew)
alias vim=/usr/local/bin/vim

# Go
export GOPATH=$HOME/Repositories/go
export PATH=$PATH:$GOPATH/bin

# Locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Nvim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/.$TERM.ti
tic ~/.$TERM.ti

# Docker
alias docker-init='eval $(docker-machine env default)'
alias docker-rmia='docker images -q --filter "dangling=true" | xargs docker rmi'
alias docker-ip='docker-machine ip default'

