#!/usr/bin/env bash

FILE="$HOME/.config/ghostty/config"
if sed --version >/dev/null 2>&1; then
    # GNU sed
    INPLACE=(-i)
else
    # macOS/BSD sed
    INPLACE=(-i '')
fi

# Extract current theme
current=$(grep -E '^theme = ' "$FILE" | awk '{print $3}')

# Define cycle
themes=(jblow jblow_black tkyo)

# Find index of current theme
for i in "${!themes[@]}"; do
    if [[ "${themes[$i]}" == "$current" ]]; then
        current_index=$i
        break
    fi
done

# Compute next index in cycle
next_index=$(((current_index + 1) % ${#themes[@]}))
next_theme="${themes[$next_index]}"

# Apply update
sed "${INPLACE[@]}" "s/^theme = .*/theme = $next_theme/" "$FILE"
echo "Switched to $next_theme"
