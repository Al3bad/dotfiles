#################################################
# --> General
#################################################

alias weather='curl v2.wttr.in/Melbourne'	# print current weather in Melbourne
alias mypubip="curl ifconfig.co"
alias mylocip="get_my_local_ip"

function mlocip() { ip route get 1.2.3.4 | awk '{print $7}' }

#################################################
# --> ls aliases
#################################################
alias ls="ls --color"
alias ll="ls -al"

#################################################
# --> xev tool
#################################################
if command -v xev &> /dev/null
then
  function identify_keycode() { xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }' }
fi

#################################################
# --> lsd tool
#################################################

if command -v lsd &> /dev/null
then
    alias ls='lsd'
    alias l='ls -al'
    alias ll='ls -a'
    alias tree='ls --tree'
fi

#################################################
# --> Kitty terminal aliases
#################################################

if command -v kitty &> /dev/null
then
  alias icat="kitty +kitten icat"
fi

#################################################
# --> Trashcan aliases
#################################################

if command -v rmtrash &> /dev/null
then
  alias rm="rmtrash"
  alias rmdir="rmdirtrash"
fi

#################################################
# --> Feh
#################################################

if command -v feh &> /dev/null
then
  alias feh-browser="feh --scale-down -B #333333 --start-at"
fi

#################################################
# --> LF - change directory
#################################################
LFCD="$HOME/.config/lf/lfcd"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi


