bindkey '^ ' autosuggest-accept

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

rc() {
    echo `fc -ln -1` > run_command.txt
}
# source ~/.config/zsh/completion.zsh
# Use colors for completion menus
# autoload -U colors && colors
# Enable menu selection when tab-completing
zstyle ':completion:*' menu select

# Highlight matches
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Better autocompletion options
autoload -Uz compinit
compinit
# Optional: make completion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Add fancy colors for completion results
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_USE_ASYNC=true
mkdir -p ~/.zsh/plugins
if [ ! -d ~/.zsh/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
fi

if [ ! -d ~/.zsh/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/plugins/zsh-syntax-highlighting
fi
if [ ! -d ~/.zsh/plugins/zsh-history-substring-search ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/plugins/zsh-history-substring-search
fi

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

if [[ "$OSTYPE" == "darwin"* ]]; then
	export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
	export PATH=$PATH:$HOME/go/bin
fi

function startruby() {
	if [[ "$OSTYPE" == "darwin"* ]]; then
		source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
		source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
	fi
}

if [[ -f ~/.fzf.zsh ]]; then
	source ~/.fzf.zsh
	eval "$(fzf --zsh)"
	export FZF_DEFAULT_OPTS="--ansi --height=40% $FZF_DEFAULT_OPTS"
fi


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
fi



# Find and set branch name var if in git repository.
function git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}
setopt prompt_subst
prompt='%2/ $(git_branch_name) > '

source $HOME/.zshrc_basic
