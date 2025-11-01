
# directory for zinit and its plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# check and downlaod zinit
if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source the zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias vi='nvim'
alias c='clear'
alias snvim='sudo -E -s nvim'
alias tmux='tmux -u'

#toggle the swap of ctrl and caps key
toggle_caps_as_ctrl() {
    setxkbmap -option "ctrl:swapcaps"   # Swap Caps Lock and Control
}

# easy ip tools

myroute() {
    ip route | grep '^default' | awk '{print $3}'
}

myip() {
    if [[ "$1" == "-4" || "$1" == "-6" ]]; then
        ver="$1"
        shift
    else
        ver="-4"
    fi

    if [ -z "$1" ]; then
        dev=$(ip route get 1 | awk '{for(i=1;i<=NF;i++) if($i=="dev") print $(i+1); exit}')
    else
        dev="$1"
    fi

    [ -z "$dev" ] && return

    if [ "$ver" = "-4" ]; then
        ip -4 addr show "$dev" | awk '/inet / {print $2}' | cut -d/ -f1
    else
        ip -6 addr show "$dev" | awk '/inet6 [^f][^e]/{print $2}' | cut -d/ -f1
    fi
}

mypubip() {
    if [[ "$1" == "-4" || "$1" == "-6" ]]; then
        ver="$1"
        shift
    else
        ver="-4"
    fi

    if [ "$ver" = "-4" ]; then
        curl -4 ifconfig.co
    else
        curl -6 ifconfig.co
    fi
}

# starship for zsh
eval "$(starship init zsh)"

# fzf setup
eval "$(fzf --zsh)"

# setup zoxide
eval "$(zoxide init --cmd cd zsh)"

# setup bat
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias fnvim='ff --bind "enter:execute(nvim {})"'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
export TERM=xterm-256color
eval "$(~/.local/bin/mise activate zsh)"

# bun completions
[ -s "/home/fayaz/.bun/_bun" ] && source "/home/fayaz/.bun/_bun"

# Turso
export PATH="$PATH:/home/fayaz/.turso"
autoload -U compinit; compinit
