# General
alias reload 'source ~/.config/fish/config.fish'

# docker / docker-compose
alias docker-prune 'docker container prune; and docker image prune'

alias dcb 'docker-compose build'
alias dcdn 'docker-compose down'
alias dcps 'docker-compose ps'
alias dcpull 'docker-compose pull'
alias dcrestart 'docker-compose restart'
alias dcrm 'docker-compose rm'
alias dcstart 'docker-compose start'
alias dcstop 'docker-compose stop'
alias dcup 'docker-compose up'
alias dcupd 'docker-compose up -d'

# git
alias gbg 'git branch -lvv | grep ": gone]"'
alias gbgd 'git_delete_gone_branches'
alias gfa 'git fetch --all --prune'
alias gg 'git graph'
alias gmt 'git mergetool --no-prompt'
alias gmu 'git_merge_upstream'
alias gpsup 'git push --set-upstream origin (git_current_branch)'
alias grba 'git rebase --abort'
alias grbc 'git rebase --continue'
alias gs 'git status'

alias gitconfig 'vim ~/.gitconfig'

# yarn
alias ycc 'yarn cache clean'
alias yout 'yarn outdated'
alias ytwa 'yarn test --watchAll'
alias yui 'yarn upgrade-interactive'
