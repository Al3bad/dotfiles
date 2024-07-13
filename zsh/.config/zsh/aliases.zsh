source $HOME/.config/zsh/utils.zsh

#------------------------------------------------
# General alises
#------------------------------------------------

alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -al'

#------------------------------------------------
# Tool specific aliases/function
#------------------------------------------------

# Check if the tool is available before defining the alias
cmdExist "dig"  \
  'alias mypubip="echo $(dig +short myip.opendns.com @resolver1.opendns.com)"'

cmdExist "broot" \
  'function tree { br --sort-by-type -c :pt "$@" }'

cmdExist "gls" \
  'alias ls="gls --color=auto --group-directories-first"'

#------------------------------------------------
# Platform specific aliases/function
#------------------------------------------------

if [ -x "$(command -v brew)" ] && [ $(uname -s) = "Darwin" ]; then
    # MacOS only
    BREW_PREFIX=$(brew --prefix)
    alias mylocip='ipconfig getifaddr en0'
    cmdExist "$BREW_PREFIX/bin/python3" \
        'alias python3="$BREW_PREFIX/bin/python3"'
elif [ -f /etc/os-release ] && grep -q "ID=arch" "/etc/os-release" ; then
    # Arch Linux only
fi

