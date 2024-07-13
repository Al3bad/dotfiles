source $HOME/.config/zsh/utils.zsh

if [ -x "$(command -v brew)" ] && [ $(uname -s) = "Darwin" ]; then
    # MacOS only
    BREW_PREFIX=$(brew --prefix)
    FPATH=$BREW_PREFIX/share/zsh-completions:$FPATH
    sourceIfExist $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    sourceIfExist $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    sourceIfExist $BREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    sourceIfExist $BREW_PREFIX/share/zsh-autopair/autopair.zsh
    # Azure CLI
    autoload bashcompinit && bashcompinit
    sourceIfExist $BREW_PREFIX/etc/bash_completion.d/az
elif [ -f /etc/os-release ] && grep -q "ID=arch" "/etc/os-release" ; then
    # Arch Linux only
    sourceIfExist /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    sourceIfExist /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# fuzzy finder `ctrl+t`
cmdExist "fzf" \
  'eval "$(fzf --zsh)"'

# Smart `cd`
cmdExist "zoxide" \
  'eval "$(zoxide init zsh)"'

# Prompt
cmdExist "starship" \
  'eval "$(starship init zsh)"'
