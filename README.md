here's a couple of things for you
script, for remote vps setup from scratch. handy thing if you want to raise a vps and want to dock something on it and work directly on the vps nvim + tmux + fish.
https://github.com/sepezho/setup-vps/blob/main/init.sh
also on remout vps added osc52 in nvim and tmux, for copying buffer from remout to local (in nvim plugin just on yank, in tmux vim-style select via Ctrl+g [ , then yank).

my dotfiles (nvim + tmux + fish) for remote vps config use tmux folder, for local (pc / laptop) use tmux_local folder. the difference between them is that on remoting in tmux you use the Ctrl+g key combination, and on local Ctrl+b.
https://github.com/sepezho/dotfiles/tree/main

+ on local (pc/note) in fish config added commands (see screenshot) for convenient and fast copying of files via scp from remot server to local. for config you create ssh key with access to north, install scp lib and write config in remote_info.txt. this theme allows to saddle quick alias for copying file and folder from remot or to remot.

