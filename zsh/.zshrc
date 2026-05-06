
# export ZSH="$HOME/.oh-my-zsh"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# ZSH_THEME="robbyrussell"
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
# ZSH_AUTOSUGGEST_USE_ASYNC=true
# plugins=(
# 	git
# 	zsh-autosuggestions
# 	sudo
# 	zsh-syntax-highlighting
# 	fzf
# )
# source $ZSH/oh-my-zsh.sh

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

setopt auto_menu 
setopt complete_in_word
setopt always_to_end

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)" && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# source ~/.config/zsh/completion.zsh
# Use colors for completion menus
# autoload -U colors && colors
# Enable menu selection when tab-completing
zstyle ':completion:*' menu select
# Highlight matches
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Optional: make completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Better autocompletion options
autoload -Uz compinit
compinit

ZSH_AUTOSUGGEST_USE_ASYNC=true

zinit wait lucid for \
    atload'_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions

zinit wait lucid for \
    zdharma-continuum/fast-syntax-highlighting

zinit wait lucid for \
    zsh-users/zsh-history-substring-search

zinit snippet OMZP::git
zinit snippet OMZP::aliases
zinit snippet OMZP::alias-finder

if [[ "$OSTYPE" == "darwin"* ]]; then
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
	export PATH=$PATH:$HOME/go/bin
fi

bindkey '^ ' autosuggest-accept
bindkey '^N' forward-word

function startruby() {
	if [[ "$OSTYPE" == "darwin"* ]]; then
		source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
		source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
    else 
        chruby $(chruby)
	fi
}

if [[ -f ~/.fzf.zsh ]]; then
	source ~/.fzf.zsh
	eval "$(fzf --zsh)"
	export FZF_DEFAULT_OPTS="--ansi --height=40% $FZF_DEFAULT_OPTS"
fi

function addfloating() {
    echo "$1" >> $HOME/floating_apps.txt
    yabai --restart-service
}


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
fi

source $HOME/.zshrc_basic
export EDITOR=nvim
