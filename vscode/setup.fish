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
  aster.vscode-subtitles \
  bierner.markdown-mermaid \
  bkromhout.vscode-tcl \
  bpruitt-goddard.mermaid-markdown-syntax-highlighting \
  bradlc.vscode-tailwindcss \
  budparr.language-hugo-vscode \
  christian-kohler.path-intellisense \
  davidnussio.vscode-jq-playground \
  dbaeumer.vscode-eslint \
  DigitalBrainstem.javascript-ejs-support \
  esbenp.prettier-vscode \
  Francisco.html-leaf \
  graphql.vscode-graphql \
  JohannesRudolph.file-ext-switcher \
  mariomatheu.syntax-project-pbxproj \
  me-dutour-mathieu.vscode-github-actions \
  mechatroner.rainbow-csv \
  mermade.openapi-lint \
  mikestead.dotenv \
  mrmlnc.vscode-scss \
  ms-dotnettools.csharp \
  mykhailogrebonkin.apple-crashlog \
  naumovs.color-highlight \
  PKief.material-icon-theme \
  Prisma.prisma \
  rebornix.ruby \
  redhat.vscode-yaml \
  ryu1kn.partial-diff \
  sbrink.elm \
  skyapps.fish-vscode \
  sleistner.vscode-fileutils \
  speedy37.ascii-plist \
  sswg.swift-lang \
  streetsidesoftware.code-spell-checker \
  svanimpe.stencil \
  tamasfe.even-better-toml \
  timonwong.shellcheck \
  vknabel.vscode-apple-swift-format \
  vknabel.vscode-swiftlint \
  waderyan.gitblame \
  wayou.vscode-todo-highlight \
  wmaurer.change-case \

if test (string upper $WHERE_AM_I) = "W"
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
