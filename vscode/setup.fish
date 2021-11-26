#!/usr/bin/env fish

if not type -q code
  # Install `code` where VS Code does
  if not test -d "/Applications/Visual Studio Code.app"
    echo "VS Code is not installed"
    exit 1
  end

  ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ~/bin/code
end

set EXTENSIONS \
  abusaidm.html-snippets \
  Arjun.swagger-viewer \
  budparr.language-hugo-vscode \
  bungcip.better-toml \
  castwide.solargraph \
  christian-kohler.path-intellisense \
  davidnussio.vscode-jq-playground \
  dbaeumer.vscode-eslint \
  DigitalBrainstem.javascript-ejs-support \
  eamodio.gitlens \
  esbenp.prettier-vscode \
  Ionide.Ionide-fsharp \
  JohannesRudolph.file-ext-switcher \
  kumar-harsh.graphql-for-vscode \
  mariomatheu.syntax-project-pbxproj \
  me-dutour-mathieu.vscode-github-actions \
  mechatroner.rainbow-csv \
  mermade.openapi-lint \
  mikestead.dotenv \
  mrmlnc.vscode-scss \
  ms-dotnettools.csharp \
  ms-vscode.cpptools \
  ms-vscode.vscode-typescript-tslint-plugin \
  ms-vsliveshare.vsliveshare \
  naumovs.color-highlight \
  PKief.material-icon-theme \
  rebornix.ruby \
  redhat.vscode-yaml \
  ryu1kn.partial-diff \
  sbrink.elm \
  skyapps.fish-vscode \
  sleistner.vscode-fileutils \
  speedy37.ascii-plist \
  streetsidesoftware.code-spell-checker \
  svanimpe.stencil \
  timonwong.shellcheck \
  wayou.vscode-todo-highlight \
  wmaurer.change-case \

set CURRENT_EXTENSIONS (code --list-extensions)

for EXTENSION in $EXTENSIONS
  if contains $EXTENSION $CURRENT_EXTENSIONS
    continue
  end

  code --install-extension $EXTENSION
end
