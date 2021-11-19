#################################################
# --> General
#################################################

alias weather='curl v2.wttr.in/Melbourne'	# print current weather in Melbourne
alias mypubip="curl ifconfig.co"
alias mylocip="get_my_local_ip"

function get_my_local_ip() { ip route get 1.2.3.4 | awk '{print $7}' }

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
