source ~/.config/fish/abbreviations.fish
source ~/.config/fish/aliases.fish
source ~/.brewconfig

nvm use default > /dev/null
status --is-interactive; and source (rbenv init -|psub)
