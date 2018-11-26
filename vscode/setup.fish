#!/usr/bin/env fish

if not type -q code
  # Install `code` where VS Code does
  ln -s /Applications/Visual Studio Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
end

set EXTENSIONS \
  ms-vscode.csharp \
  naumovs.color-highlight \
  msjsdiag.debugger-for-chrome \
  hbenl.vscode-firefox-debug \
  sleistner.vscode-fileutils \
  JohannesRudolph.file-ext-switcher \
  skyapps.fish-vscode \
  waderyan.gitblame \
  PKief.material-icon-theme \
  ryu1kn.partial-diff \
  christian-kohler.path-intellisense \
  esbenp.prettier-vscode \
  mechatroner.rainbow-csv \
  rebornix.Ruby \
  timonwong.shellcheck \
  wayou.vscode-todo-highlight \
  eg2.tslint

for EXTENSION in $EXTENSIONS
  code --install-extension $EXTENSION
end

# Other extensions - probably don't always want these installed - maybe just toss in the wiki?
# TODO: Identifiers
# ejs
# c/c++
# diff
# docker
# html snippets
# openapi-lint
# php debug
# powershell
# scss intellisense
# swagger viewer
# stylelint
# vs code live share
