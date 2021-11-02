if [[ -d ${ZSH}/plugins/zsh-autosuggestions ]]; then
    source ${ZSH}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    echo "[ WARNING ] zsh-autosuggestions plugin is not installed!"
fi

