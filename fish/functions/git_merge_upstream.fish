function git_merge_upstream --description "Merge the current branch's upstream into the local copy"
  set remoteName origin
  if test -n $argv[1]
    set remoteName $argv[1]
  end

  set currentBranch (git_current_branch)
  set upstream (git rev-parse --abbrev-ref $currentBranch@{upstream})
  set upstreamResult $status

  if test $upstreamResult -ne 0
    return $upstreamResult
  else if test -z $upstream
    echo "Could not get upstream branch for $currentBranch" >&2
    return 1
  end

  echo "Merging $upstream into $currentBranch"
  git merge $upstream
end
