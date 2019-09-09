function mkcd --description "Makes a directory and changes into it"
  mkdir -p $argv && cd $argv
end
