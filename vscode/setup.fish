#!/usr/bin/env fish

if not type -q code
  # Install `code` where VS Code does
  if not test -d "/Applications/Visual Studio Code.app"
    echo "VS Code is not installed"
    exit 1
  end

  ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code
end

set EXTENSIONS \
  abusaidm.html-snippets \
  Arjun.swagger-viewer \
  budparr.language-hugo-vscode \
  bungcip.better-toml \
  castwide.solargraph \
  christian-kohler.path-intellisense \
  davidnussio.vscode-jq-playground \
  eamodio.gitlens \
  esbenp.prettier-vscode \
  firefox-devtools.vscode-firefox-debug \
  Ionide.Ionide-fsharp \
  JohannesRudolph.file-ext-switcher \
  kumar-harsh.graphql-for-vscode \
  mechatroner.rainbow-csv \
  mermade.openapi-lint \
  mrmlnc.vscode-scss \
  ms-vscode.cpptools \
  ms-vscode.csharp \
  ms-vscode.vscode-typescript-tslint-plugin \
  ms-vsliveshare.vsliveshare \
  msjsdiag.debugger-for-chrome \
  naumovs.color-highlight \
  PKief.material-icon-theme \
  QassimFarid.ejs-language-support \
  rebornix.ruby \
  redhat.vscode-yaml \
  ryu1kn.partial-diff \
  sbrink.elm \
  shinnn.stylelint \
  skyapps.fish-vscode \
  sleistner.vscode-fileutils \
  streetsidesoftware.code-spell-checker \
  timonwong.shellcheck \
  wayou.vscode-todo-highlight \

set CURRENT_EXTENSIONS (code --list-extensions)

for EXTENSION in $EXTENSIONS
  if contains $EXTENSION $CURRENT_EXTENSIONS
    continue
  end

  code --install-extension $EXTENSION
end
