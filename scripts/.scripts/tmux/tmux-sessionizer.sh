#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(find ~/personal ~/class ~/ ~/personal/cpp \
		-mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf)
fi
if [[ -z $selected ]]; then
	exit 0
fi

tmsession.sh $selected
