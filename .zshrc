# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Load plugins
plugins=(
    git 
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Starship prompt
eval "$(starship init zsh)"

# Fix for duplicate libraries
export KMP_DUPLICATE_LIB_OK=TRUE

# Conda setup
__conda_setup="$('/Users/simon198/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/simon198/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/simon198/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/simon198/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

# Mamba setup
if [ -f "/Users/simon198/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/simon198/miniforge3/etc/profile.d/mamba.sh"
fi

# PostgreSQL setup
export PATH="$HOME/bin/scripts:/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# fzf setup
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range:500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
    local command=$1
    shift
    case "$command" in
        cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh) fzf --preview 'dig {}' "$@" ;;
        *) fzf --preview 'bat -n --color=always --line-range=:500 {}' "$@" ;;
    esac
}

# Custom ls alias with eza
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-user --no-time"

# Thefuck aliases
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Zoxide setup with cd alias
eval "$(zoxide init zsh)"
alias cd=z

# Tmux-sessionizer
bindkey -s ^f "tmux-sessionizer\n"

# Alias
alias n='nvim'
alias t='tmux'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Path for mactex
export PATH="/Library/TeX/texbin:$PATH"

# lazygit 
bindkey -s ^g "lazygit\n"

# yazi

export EDITOR="nvim"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

. "$HOME/.local/bin/env"
