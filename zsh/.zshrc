export PATH="/bin:$PATH"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"
bindkey '^ ' autosuggest-accept
# bindkey '^ '      autosuggest-execute
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
#ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true




# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zstyle ':omz:plugins:nvm' lazy yes
plugins=(
	git
web-search
zsh-autosuggestions
sudo
zsh-syntax-highlighting
fzf
# nvm
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [[ "$(uname)" == "Linux" ]]; then
  alias cat="batcat"
else
  alias cat="bat"
fi
alias mkdir="mkdir -pv" 
alias c="clear"
alias rd="rm -rf"

function chdir() {
mkdir -p "$1" && cd "$1";
}

# configs
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias nvimconfig='nvim ~/.config/nvim'
alias savezshconfig="source ~/.zshrc"
alias tmuxconfig='nvim ~/.tmux.conf'
alias alacrittyconfig="nvim ~/.alacritty.toml"


# vim 
alias n='nvim'
alias nf='nvim "$(fzf)"'
alias cf='cat "$(fzf)"'
alias uw='ssh adriansen@best-linux.cs.wisc.edu'
alias mount354='sshfs adriansen@best-linux.cs.wisc.edu://home/adriansen/private/cs354/ /tmp/remote-mount'
alias mount368='sshfs adriansen@best-linux.cs.wisc.edu://home/adriansen/private/cs368/ /tmp/remote-mount'
alias mount537='sshfs adriansen@best-linux.cs.wisc.edu://home/adriansen/private/cs537/ /tmp/remote-mount'
alias mount='sshfs adriansen@best-linux.cs.wisc.edu://home/adriansen/private/ /tmp/remote-mount'
alias vimmount='cd /tmp/remote-mount && nvim .'
alias unmount='cd && umount /tmp/remote-mount/'

# tmux
alias td="tmux detach"
alias ta="tmux attach"
alias t="~/.local/scripts/tmux-sessionizer.sh"
PATH="$PATH":"$HOME/.local/scripts/"
bindkey -s '^f' 'tmux-sessionizer.sh\n'

alias clangformatfilehere='$(which clang-format) --style="{BasedOnStyle: google, ColumnLimit: 100}"  --dump-config > .clang-format'
alias cpphere='cp -f ~/dotfiles/clang/.clang-format .; cp -f ~/dotfiles/clang/.clang-tidy .; cp -f ~/dotfiles/clang/.editorconfig .'
alias cmakehere='cp ~/dotfiles/clang/CMakeLists.txt .'
alias pt="python3 tasks.py"

alias lg="lazygit"

# scripts
# alias imgcat='~/scripts/imgcat.sh'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if [[ "$(uname)" == "Linux" ]]; then
    # Set the compiler for Linux
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
  export PATH=$PATH:$HOME/go/bin
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh
# chruby 3.3.1
  # source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh 
fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS="--ansi --height=40% $FZF_DEFAULT_OPTS"

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
# if [[ "$(uname)" == "Linux" ]]; then
#   export PATH="/home/tony/.local/share/fnm:$PATH"
#   eval "`fnm env`"
# fi

# must clone vcpkg into this dir
export VCPKG_ROOT="$HOME/dep/vcpkg"
export PATH=$PATH:$VCPKG_ROOT
export PATH=$PATH:"$HOME/dep/tracy/bin"
export PATH=$PATH:"$HOME/dotfiles/bin/.local/scripts/"
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
