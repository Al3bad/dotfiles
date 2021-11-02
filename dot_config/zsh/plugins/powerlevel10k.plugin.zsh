if [[ -d ${ZSH}/plugins/powerlevel10k/powerlevel10k ]]; then
    # Run this only if starship tool exists
    if command -v starship &> /dev/null
    then
        eval "$(starship init zsh)"
    fi
    
    # Execute the plugin
    source ${ZSH}/plugins/powerlevel10k/powerlevel10k/powerlevel10k.zsh-theme
    
    # Apply the configuration
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ${ZSH}/plugins/powerlevel10k/.p10k.zsh ]] || source ${ZSH}/plugins/powerlevel10k/.p10k.zsh
else
    echo "[ WARNING ] powerlevel10k plugin is not installed!"
fi

