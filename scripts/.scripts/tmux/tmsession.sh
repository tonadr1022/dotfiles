#!/usr/bin/env bash

if [[ -z "$1" ]]; then
	echo "Usage: tmsession <directory_name>"
	exit 1
fi
selected=$1
selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -s $selected_name -c $selected
	exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
	tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
	tmux attach -t $selected_name
else
	tmux switch-client -t $selected_name
fi
