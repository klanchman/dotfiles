#!/usr/bin/env fish

if not type -q code
  # Install `code` where VS Code does
  if not test -d "/Applications/Visual Studio Code.app"
    echo "VS Code is not installed"
    exit 1
  end

  ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ~/bin/code
end

read -P "[H]ome or [W]ork? " WHERE_AM_I

set EXTENSIONS \
  abusaidm.html-snippets \
  Arjun.swagger-viewer \
  bierner.markdown-mermaid \
  bpruitt-goddard.mermaid-markdown-syntax-highlighting \
  budparr.language-hugo-vscode \
  bungcip.better-toml \
  christian-kohler.path-intellisense \
  davidnussio.vscode-jq-playground \
  dbaeumer.vscode-eslint \
  DigitalBrainstem.javascript-ejs-support \
  eamodio.gitlens \
  esbenp.prettier-vscode \
  graphql.vscode-graphql \
  Ionide.Ionide-fsharp \
  JohannesRudolph.file-ext-switcher \
  mariomatheu.syntax-project-pbxproj \
  me-dutour-mathieu.vscode-github-actions \
  mechatroner.rainbow-csv \
  mermade.openapi-lint \
  mikestead.dotenv \
  mrmlnc.vscode-scss \
  ms-dotnettools.csharp \
  ms-vscode.vscode-typescript-tslint-plugin \
  mykhailogrebonkin.apple-crashlog \
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

if test "$WHERE_AM_I" = "W"
  set -a EXTENSIONS \
    ms-azuretools.vscode-bicep \
    ms-vsliveshare.vsliveshare \

end

set CURRENT_EXTENSIONS (code --list-extensions)

for EXTENSION in $EXTENSIONS
  if contains $EXTENSION $CURRENT_EXTENSIONS
    continue
  end

  code --install-extension $EXTENSION
end
