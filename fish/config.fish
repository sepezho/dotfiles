# Set terminal and greeting
set fish_greeting ""
set -gx TERM xterm-256color

# Theme settings
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Aliases
alias c "cd"
alias v "nvim -n"
alias l "ls -la -h"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

# Editor and PATH settings
set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM - Automatically use Node version based on .nvmrc
function __check_rvm --on-variable PWD --description 'Use Node version from .nvmrc if present'
    status --is-command-substitution; and return
    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    end
end

# OS-specific configuration
switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

# Local configuration
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# Remote SSH/SCP aliases using information from a separate file
function logremote
    set -l remote_info_file ~/.config/fish/remote_info.txt
    if test -f $remote_info_file
        # Read the lines, trimming any extra spaces
        set -l remote_ip (string trim (sed -n 1p $remote_info_file))
        set -l identity_file_name (string trim (sed -n 2p $remote_info_file))
        set -l remote_user (string trim (sed -n 3p $remote_info_file))
        set -l identity_file ~/.ssh/$identity_file_name

        # Debugging: Print the command
        echo "Running command: ssh $remote_user@$remote_ip -i $identity_file $argv"

        # Execute the command
        ssh $remote_user@$remote_ip -i $identity_file $argv
    else
        echo "Error: $remote_info_file does not exist."
    end
end

function copyremote
    set -l remote_info_file ~/.config/fish/remote_info.txt
    if test -f $remote_info_file
        # Read the lines, trimming any extra spaces
        set -l remote_ip (string trim (sed -n 1p $remote_info_file))
        set -l identity_file_name (string trim (sed -n 2p $remote_info_file))
        set -l remote_user (string trim (sed -n 3p $remote_info_file))
        set -l identity_file ~/.ssh/$identity_file_name

        set -l remote_path $argv[1]
        set -l local_path $argv[2]
        
        # Debugging: Print the command
        echo "Running command: scp -i $identity_file $remote_user@$remote_ip:$remote_path $local_path"

        # Execute the command
        scp -i $identity_file $remote_user@$remote_ip:$remote_path $local_path
    else
        echo "Error: $remote_info_file does not exist."
    end
end

function sendremote
    set -l remote_info_file ~/.config/fish/remote_info.txt
    if test -f $remote_info_file
        # Read the lines, trimming any extra spaces
        set -l remote_ip (string trim (sed -n 1p $remote_info_file))
        set -l identity_file_name (string trim (sed -n 2p $remote_info_file))
        set -l remote_user (string trim (sed -n 3p $remote_info_file))
        set -l identity_file ~/.ssh/$identity_file_name

        set -l local_path $argv[1]
        set -l remote_path $argv[2]
        
        # Debugging: Print the command
        echo "Running command: scp -i $identity_file $local_path $remote_user@$remote_ip:$remote_path"

        # Execute the command
        scp -i $identity_file $local_path $remote_user@$remote_ip:$remote_path
    else
        echo "Error: $remote_info_file does not exist."
    end
end

# Google Cloud SDK path update
if [ -f '/Users/sepezho/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/sepezho/Downloads/google-cloud-sdk/path.fish.inc'
end

