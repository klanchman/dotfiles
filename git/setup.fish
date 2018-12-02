#!/usr/bin/env fish

# Skip setup if ~/.gitconfig.local exists and has at least as many lines
# as the template file
if test -e ~/.gitconfig.local; and test (wc -l < ~/.gitconfig.local) -ge (wc -l < git/gitconfig.local.example)
  exit
end

read -P "Email address for git> " GIT_EMAIL_ADDRESS
sed -e "s/AUTHOREMAIL/$GIT_EMAIL_ADDRESS/g" git/gitconfig.local.example > git/gitconfig.local
