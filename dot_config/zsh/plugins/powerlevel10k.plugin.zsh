if [[ -d ${ZSH}/plugins/powerlevel10k/powerlevel10k ]]; then
    eval "$(starship init zsh)"
    source ${ZSH}/plugins/powerlevel10k/powerlevel10k/powerlevel10k.zsh-theme

    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ${ZSH}/plugins/powerlevel10k/.p10k.zsh ]] || source ${ZSH}/plugins/powerlevel10k/.p10k.zsh
else
    echo "[ WARNING ] powerlevel10k plugin is not installed!"
fi

