source ~/.bashrc
source ~/.profile

# parse git branch to add to shell prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Set CLICOLOR for Ansi Colors in iTerm2
export CLICOLOR=1

# Compose prompt with colors `bradford@skynet ~/workspace/projects/graphql_rust (master)`
export PS1="\[\033[36m\]bradford\[\033[m\]@\[\033[32m\]skynet \[\033[33;1m\]\w\[\033[35m\]\$(parse_git_branch)\[\033[00m\] "

# "McFly replaces your default ctrl-r Bash history search with an intelligent search engine that takes
# into account your working directory and the context of recently executed commands. McFly's
# suggestions are prioritized in real time with a small neural network.""
# https://github.com/cantino/mcfly
if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
  . $(brew --prefix)/opt/mcfly/mcfly.bash
fi

# Go
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# RabbitMQ
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# linkerd https://linkerd.io/2/getting-started/
export PATH=$PATH:$HOME/.linkerd2/bin

# Python 3
export PATH=$PATH:/Users/bradford/Library/Python/3.7/bin

# LLVM
export PATH="/usr/local/opt/llvm/bin:$PATH"

# RVM - Add RVM to PATH and load RVM into a shell session *as a function* Make
# sure this is the last PATH variable change
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# kubernetes bash completion
source <(kubectl completion bash)

# shorthand alias for kubectl that also works with completion
alias kc=kubectl
complete -F __start_kubectl kc

# "Local Kubernetes development with no stress" - I use solograph for ruby in VS code, which in turn depends on
# a gem called tilt. Paths clashed and just decided to call this ktilt (kubernetes tilt) to fix collision.
# https://github.com/windmilleng/tilt
alias ktilt=/usr/local/Cellar/tilt/0.12.3/bin/tilt

# https://github.com/sharkdp/bat
alias cat=bat

# A command-line system information tool written in bash 3.2+
# https://github.com/dylanaraps/neofetch
neofetch