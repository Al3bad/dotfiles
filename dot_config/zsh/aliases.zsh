#################################################
# --> General
#################################################

alias weather='curl v2.wttr.in/Melbourne'	# print current weather in Melbourne
alias mypubip="curl ifconfig.co"
alias mylocip="get_my_local_ip"

function get_my_local_ip() { ip route get 1.2.3.4 | awk '{print $7}' }

#################################################
# --> ptls tool
#################################################

if command -v ptls &> /dev/null
then
    alias ls='ptls'
    alias pwd='ptpwd'
    alias mkdir='ptmkdir'
    alias touch='pttouch'
fi

#################################################
# --> 
#################################################
