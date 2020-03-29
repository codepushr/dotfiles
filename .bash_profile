# Terminal Colors
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls="ls -la"

# DNS
alias dns-clear='sudo killall -HUP mDNSResponder; sleep 2; echo macOS DNS Cache Reset | say'

# Add /usr/local/bin and sbin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Postgres app
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Vim (from Brew)
alias vim=/usr/local/bin/vim

# Go
# export GOPATH=$HOME/Repositories/go
export PATH=$PATH:$GOROOT/bin

# PHP
export PATH=$PATH:/Users/palic/.composer/vendor/bin

# Locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Nvim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/.$TERM.ti
tic ~/.$TERM.ti

# Docker
alias docker-init='eval $(docker-machine env default)'
alias docker-rmia='docker images -q --filter "dangling=true" | xargs docker rmi -f'
alias docker-rma='docker rm $(docker ps -a -q)'
alias docker-ip='docker-machine ip default'

# Terragrunt
export TERRAGRUNT_TFPATH=/usr/local/bin/terraform

# AWS default profile
export AWS_PROFILE=peter

# Flutter
export PATH="$PATH:$HOME/Repositories/flutter/sdk/bin"

# Postgres
rm -f /usr/local/var/postgres/postmaster.pid


export PATH="$HOME/.cargo/bin:$PATH"
