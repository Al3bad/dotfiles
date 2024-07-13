# ZSH-Z plugin
export ZSHZ_DATA="$HOME/.cache/.z"

# Shell history configurations
export HISTFILE="$HOME/.cache/.zsh_history"
export HISTSIZE=100
export SAVEHINT=100

# Disable shell session
export SHELL_SESSIONS_DISABLE=1

# Add PATH(s)
export PATH=/opt/homebrew/bin:$PATH

# NVM tool
export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v nvim &> /dev/null; then
  export VISUAL=nvim
  export EDITOR=nvim
else
  export VISUAL=vim
  export EDITOR=vim
fi

# Enable colored output for less and man commands
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# zsh-vi-mode plugin
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# Created by `pipx` on 2024-05-19 05:24:05
export PATH="$PATH:/Users/alabbad/.local/bin"

# WakaTime nvim plugin
export WAKATIME_HOME="$HOME/.local/share/vim-wakatime"

# neovim kickstart config
alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'

# Use java version 11 (for advanced programming)
# alias java="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java $@"
