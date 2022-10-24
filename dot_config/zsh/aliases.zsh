alias mkdir='mkdir -p'
alias tree='tree -C'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias ll='ls -al'

# MacOS Only
if [ $(uname -s) = "Darwin" ]; then
  alias installed-apps='echo "\n=====================\nMacOS Applications\n====================\n$(ls -1 /Applications)\n\n====================\nBrew\n====================\n$(brew leaves)\n\n====================\nBrew (Cask)\n====================\n$(brew list --cask | tr "\t" "\n")\n\n====================\nNPM (global)\n====================\n$(npm ls --location=global)"'
  alias mylocip='ipconfig getifaddr en0'
fi

# Check if the tool is available before defining the alias
command -v dig &> /dev/null && \
  alias mypubip='echo $(dig +short myip.opendns.com @resolver1.opendns.com)' || \
  echo '[alias=mypubip] dig command is not available!'
