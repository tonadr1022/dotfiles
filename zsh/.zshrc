bindkey '^ ' autosuggest-accept

# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
# ZSH_AUTOSUGGEST_USE_ASYNC=true
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# plugins=(
# 	git
# 	zsh-autosuggestions
# 	sudo
# 	zsh-syntax-highlighting
# 	fzf
# )
# source $ZSH/oh-my-zsh.sh

# Load zsh-autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Load zsh-syntax-highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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
# Enable substitution in the prompt.
setopt prompt_subst
# Config for prompt. PS1 synonym.
prompt='%2/ $(git_branch_name) > '

source $HOME/.zshrc_basic
