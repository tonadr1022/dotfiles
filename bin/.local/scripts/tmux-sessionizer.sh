#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(find ~/personal ~/class ~/ ~/class/cs577 -mindepth 1 -maxdepth 1 -type d | fzf)
fi
echo "before selection"
if [[ -z $selected ]]; then
	exit 0
fi

echo "after selection"
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)
echo "after assignment"
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -s $selected_name -c $selected
	exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
	echo "create session -ds"
	tmux new-session -ds $selected_name -c $selected
fi

echo "before final command"
if [[ -z $TMUX ]]; then
	echo "not running, attaching"
	tmux attach -t $selected_name
else
	echo "running, switching"
	tmux switch-client -t $selected_name
fi
