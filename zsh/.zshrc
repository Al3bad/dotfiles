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

# The next line updates PATH for the Google Cloud SDK.
# if [ -f "$HOME/.local/bin/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.local/bin/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
# if [ -f "$HOME/.local/bin/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.local/bin/google-cloud-sdk/completion.zsh.inc"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alabbad/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alabbad/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alabbad/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alabbad/google-cloud-sdk/completion.zsh.inc'; fi
