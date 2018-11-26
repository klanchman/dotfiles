# docker / docker-compose
alias docker-prune='docker container prune; and docker image prune'

alias dcb='docker-compose build'
alias dcdn='docker-compose down'
alias dce='docker-compose exec'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs -f'
alias dcps='docker-compose ps'
alias dcpull='docker-compose pull'
alias dcr='docker-compose run'
alias dcrestart='docker-compose restart'
alias dcrm='docker-compose rm'
alias dcstart='docker-compose start'
alias dcstop='docker-compose stop'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'

# git
alias gbg='git branch -lvv | grep gone'
alias gcb='git checkout -b'
alias gfa='git fetch --all --prune'
alias gg='git graph'
alias gmt='git mergetool --no-prompt'
alias gpsup='git push --set-upstream origin (git_current_branch)'
alias gs='git status'

alias gitconfig='vim ~/.gitconfig'

# yarn
alias yout='yarn outdated'
alias yui='yarn upgrade-interactive'
