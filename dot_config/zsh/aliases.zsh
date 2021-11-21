#################################################
# --> General
#################################################

alias weather='curl v2.wttr.in/Melbourne'	# print current weather in Melbourne
alias mypubip="curl ifconfig.co"
alias mylocip="get_my_local_ip"
# alias identify-keycode="identify_keycode"

function mlocip() { ip route get 1.2.3.4 | awk '{print $7}' }
function identify-keycode() { xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }' }

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
