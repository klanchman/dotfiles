fish_add_path ~/bin /opt/local/bin /opt/local/sbin

source ~/.config/fish/abbreviations.fish
source ~/.config/fish/aliases.fish
source ~/.brewconfig

nvm use default > /dev/null
status --is-interactive; and source (rbenv init -|psub)
