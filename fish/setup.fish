#!/usr/bin/env fish

# Configure environment variables
set -xU LESS -R
set -U fish_user_paths ~/bin

# Color theme
set -U fish_color_autosuggestion 93a1a1
set -U fish_color_cancel -r
set -U fish_color_command 586e75
set -U fish_color_comment 93a1a1
set -U fish_color_cwd 'blue' '--bold'
set -U fish_color_cwd_root red
set -U fish_color_end 268bd2
set -U fish_color_error dc322f
set -U fish_color_escape 'bryellow'  '--bold'
set -U fish_color_history_current --bold
set -U fish_color_host green
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator bryellow
set -U fish_color_param 657b83
set -U fish_color_quote 839496
set -U fish_color_redirection 6c71c4
set -U fish_color_search_match 'bryellow'  '--background=brblack'
set -U fish_color_selection 'white'  '--bold'  '--background=brblack'
set -U fish_color_status red
set -U fish_color_user green
set -U fish_color_valid_path --underline
set -U fish_pager_color_completion
set -U fish_pager_color_description 'B3A06D'  'yellow'
set -U fish_pager_color_prefix 'white'  '--bold'  '--underline'
set -U fish_pager_color_progress 'brwhite'  '--background=cyan'

# Install `bass`
mkdir -p ~/git-repos
if test -d ~/git-repos/bass
  cd ~/git-repos/bass
  git pull
else
  git clone git@github.com:edc/bass.git ~/git-repos/bass
  cd ~/git-repos/bass
end
make install
cd -
