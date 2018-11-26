#!/usr/bin/env fish

set DESTINATION_FILE destination
set IGNORES_FILE ignores
set SCRIPT_FILE setup.fish

set ALWAYS_IGNORE_NAMES $DESTINATION_FILE $IGNORES_FILE $SCRIPT_FILE

function contains_match
  for elem in $argv[2..-1]
    if test (string match $elem $argv[1])
      return 0
    end
  end

  return 1
end

#-----
# Main

for CONCERN in (find (pwd) -type d -depth 1 -not -name '.git')
  if test -f $CONCERN/$SCRIPT_FILE
    # Use `source` so that interactive setup scripts can do what they need to
    source $CONCERN/$SCRIPT_FILE
  end

  set PREPEND ""
  if test -f $CONCERN/$DESTINATION_FILE
    # eval/echo to expand variables in the path
    set DESTINATION (eval echo (head $CONCERN/$DESTINATION_FILE))
    mkdir -p $DESTINATION
  else
    set PREPEND .
    set DESTINATION $HOME
  end

  set IGNORE_NAMES $ALWAYS_IGNORE_NAMES
  if test -f $CONCERN/$IGNORES_FILE
    read -az IGNORES_FROM_FILE < $CONCERN/$IGNORES_FILE
    set IGNORE_NAMES $IGNORE_NAMES $IGNORES_FROM_FILE
  end

  # TODO: Had some issues when trying to use printf for the find command
  # Manually filtering things out for now
  # set IGNORE_STRING (printf " -not -name '%s'" $IGNORE_NAMES)

  for FILE_TO_LINK in (find $CONCERN -type file)
    set FILENAME (basename $FILE_TO_LINK)

    if contains_match $FILENAME $IGNORE_NAMES
      continue
    end

    set REST_OF_DIRNAME (string replace $CONCERN "" (dirname $FILE_TO_LINK))
    set OUTPUT_FILENAME $PREPEND$FILENAME
    set FULL_DIRNAME $DESTINATION$REST_OF_DIRNAME
    set FULL_OUTPUT_PATH $FULL_DIRNAME/$OUTPUT_FILENAME

    if not test -d $FULL_DIRNAME
      mkdir -p $FULL_DIRNAME
    end

    ln -sf $FILE_TO_LINK $FULL_OUTPUT_PATH
  end
end
