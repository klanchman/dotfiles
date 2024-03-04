#!/usr/bin/env fish

mise use -g usage
mise completion fish > ~/.config/fish/completions/mise.fish

mise plugins install -y dotnet

# You probably want to install some tools:
# mise use -g node@<lts>
# mise use -g ruby@<latest>
# mise use -g dotnet@<lts>
