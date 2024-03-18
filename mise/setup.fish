#!/usr/bin/env fish

mise use -g usage
mise completion fish > ~/.config/fish/completions/mise.fish

mise plugins install -y dotnet

mise install python 2.7 # For itermoxyl
mise install python 3
mise use -g python@3 python@2.7

# You probably want to install some tools:
# mise use -g node@<lts>
# mise use -g ruby@<latest>
# mise use -g dotnet@<lts>
