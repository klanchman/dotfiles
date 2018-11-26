#!/usr/bin/env fish

read -P "Email address for git> " GIT_EMAIL_ADDRESS
sed -e "s/AUTHOREMAIL/$GIT_EMAIL_ADDRESS/g" git/gitconfig.local.example > git/gitconfig.local
