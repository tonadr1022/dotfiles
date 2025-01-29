curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

FNM_PATH="/home/tony/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
	# Add fnm to PATH and evaluate its environment
	export PATH="/home/tony/.local/share/fnm:$PATH"
	eval "$(fnm env)"

	# Ensure this is only added once to .zshrc.local
	grep -qxF 'export PATH="/home/tony/.local/share/fnm:$PATH"' $HOME/.zshrc.local || echo 'export PATH="/home/tony/.local/share/fnm:$PATH"' >>$HOME/.zshrc.local
	grep -qxF 'eval "$(fnm env)"' $HOME/.zshrc.local || echo 'eval "$(fnm env)"' >>$HOME/.zshrc.local
fi
fnm install 22
npm install typescript@latest
npm install gtop -g
