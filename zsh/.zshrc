ZSH=$HOME/.config/zsh

source $ZSH/utils.zsh

# ZSH options
sourceIfExist $ZSH/options.zsh

# ZSH env
sourceIfExist $ZSH/env.zsh

# ZSH aliases
sourceIfExist $ZSH/aliases.zsh

# ZSH plugins
sourceIfExist $ZSH/plugins.zsh

# bun completions
sourceIfExist "${HOME}/.bun/_bun"

#------------------------------------------------
# Extra
#------------------------------------------------

# broot tool (brew)
cmdExist "broot" \
    'sourceIfExist ${HOME}/.config/broot/launcher/bash/br'

# Enable completion
autoload -Uz compinit; compinit -d $HOME/.cache/.zcompdump

#------------------------------------------------

cmdExist "fastfetch" \
    fastfetch
