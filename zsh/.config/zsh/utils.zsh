# Associative array to track which commands we've checked
typeset -A checked_commands

# Function to check if a command exists and handle multiple aliases/functions
cmdExist() {
    local cmd="$1"
    shift

    if [[ -z "${checked_commands[$cmd]}" ]]; then
        if command -v "$cmd" >/dev/null 2>&1; then
            checked_commands[$cmd]=1
            while (( $# > 0 )); do
                eval "$1"
                shift
            done
        else
            checked_commands[$cmd]=0
            echo "[ZSH_UTILS] Command '$cmd' not available!"
        fi
    elif [[ "${checked_commands[$cmd]}" -eq 1 ]]; then
        while (( $# > 0 )); do
            eval "$1"
            shift
        done
    fi
}

# Source file only if it's exist
sourceIfExist() {
    local file="$1"
    if [[ -f "$file" && -r "$file" ]]; then
        source "$file"
    # else
    #     echo "Warning: File '$file' does not exist or is not readable. Skipping."
    fi
}
