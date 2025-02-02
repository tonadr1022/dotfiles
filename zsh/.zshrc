export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_USE_ASYNC=true
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
	git
	zsh-autosuggestions
	sudo
	zsh-syntax-highlighting
	fzf
)
source $ZSH/oh-my-zsh.sh

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

source $HOME/.zshrc_basic