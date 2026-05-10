# ============================
# ZINIT setup
# ============================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# ============================
# Custom completions path
# ============================
fpath=(~/.zsh/completions $fpath)

# ============================
# Load completions once
# ============================
autoload -Uz compinit
compinit

# ============================
# Zinit plugins
# ============================
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# CD replay
zinit cdreplay -q

# ============================
# Keybindings
# ============================
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# ============================
# History
# ============================
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

# ============================
# Completion styling
# ============================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:gwt:*' fzf-preview 'git log --oneline --max-count=20 {2}'

# ============================
# Aliases
# ============================
alias ls='ls --color'
alias vim='nvim'
alias vi='nvim'
alias c='clear'
alias snvim='sudo -E -s nvim'
alias tmux='tmux -u'

# ============================
# Swap Ctrl/Caps toggle
# ============================
toggle_caps_as_ctrl() {
    setxkbmap -option "ctrl:swapcaps"
}

# ============================
# Network helpers
# ============================
myroute() {
    ip route | awk '/^default/ {print $3}'
}

myip() {
    local ver="$1" dev
    [[ "$ver" != "-4" && "$ver" != "-6" ]] && ver="-4"
    dev=${2:-$(ip route get 1 | awk '{for(i=1;i<=NF;i++) if($i=="dev") print $(i+1); exit}')}
    [[ -z $dev ]] && return
    if [[ $ver = "-4" ]]; then
        ip -4 addr show "$dev" | awk '/inet / {print $2}' | cut -d/ -f1
    else
        ip -6 addr show "$dev" | awk '/inet6 [^f][^e]/ {print $2}' | cut -d/ -f1
    fi
}

mypubip() {
    local ver="$1"; [[ "$ver" != "-4" && "$ver" != "-6" ]] && ver="-4"
    if [[ "$ver" = "-4" ]]; then curl -4 ifconfig.co; else curl -6 ifconfig.co; fi
}

# ============================
# Git aliases
# ============================
alias gits='git status --short'
alias gitd='git diff'
alias gita='git add'
alias gitc='git commit'
alias gitl='git log --all --graph --oneline'
alias gitcl='git clone'
alias gitu='git pull'

# ============================
# Git + worktree switcher
# ============================
gwt() {
  local branch="$1"
  local wt

  [[ -z $branch ]] && return

  # Branch checked out in another worktree?
  wt=$(git worktree list --porcelain 2>/dev/null |
       awk -v b="$branch" '
         $1=="worktree"{w=$2}
         $1=="branch" && $2=="refs/heads/"b {print w}')

  if [[ -n $wt ]]; then
    cd "$wt"
    return
  fi

  # Otherwise just switch
  git switch "$branch"
}

# ============================
# Starship prompt
# ============================
eval "$(starship init zsh)"

# ============================
# fzf
# ============================
eval "$(fzf --zsh)"

# ============================
# zoxide
# ============================
eval "$(zoxide init --cmd cd zsh)"

# ============================
# bat setup
# ============================
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
alias ff='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias fnvim='ff --bind "enter:execute(nvim {})"'

# ============================
# Misc
# ============================
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
eval "$(~/.local/bin/mise activate zsh)"

[ -s "/home/fayaz/.bun/_bun" ] && source "/home/fayaz/.bun/_bun"
export PATH="$PATH:/home/fayaz/.turso"

precmd() {
  echo -ne '\e[2 q'
}

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Force block cursor after all initialization
echo -ne '\e[2 q'

