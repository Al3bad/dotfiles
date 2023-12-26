alias mkdir='mkdir -p'
# alias tree='tree -C'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias ll='ls -al'
alias python3='/opt/homebrew/bin/python3'
alias hext="open -a 'HextEdit'"

# Directories
alias cddev='cd ~/dev'

# MacOS Only
if [ $(uname -s) = "Darwin" ]; then
  alias installed-apps='echo "\n=====================\nMacOS Applications\n====================\n$(ls -1 /Applications)\n\n====================\nBrew\n====================\n$(brew leaves)\n\n====================\nBrew (Cask)\n====================\n$(brew list --cask | tr "\t" "\n")\n\n====================\nNPM (global)\n====================\n$(npm ls --location=global)"'
  alias mylocip='ipconfig getifaddr en0'
fi


# Check if the tool is available before defining the alias
command -v dig &> /dev/null && \
  alias mypubip='echo $(dig +short myip.opendns.com @resolver1.opendns.com)' || \
  echo '[alias=mypubip] dig command is not available!'

command -v broot &> /dev/null && \
  function tree { br --sort-by-type -c :pt "$@" }

command -v docker &> /dev/null && \
  alias dockps='docker ps --format "{{.ID}}  {{.Names}}"' && \
  function docksh() { docker exec -it $1 /bin/bash; }
