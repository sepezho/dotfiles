
# ~/.tmux/copy.sh
#!/bin/bash

# Read input
input=$(cat)

# Base64 encode the input
encoded=$(printf '%s' "$input" | base64 | tr -d '\n')

# Send OSC 52 escape sequence
printf '\033]52;c;%s\a' "$encoded"
