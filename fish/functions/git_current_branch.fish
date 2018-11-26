function git_current_branch
  set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
  if test -z $branch
    return
  end
  echo $branch
end
