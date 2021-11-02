if [[ -d ${ZSH}/plugins/zsh-syntax-highlighting ]]; then
    source ${ZSH}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    echo "[ WARNING ] zsh-syntax-highlighting plugin is not installed!"
fi

