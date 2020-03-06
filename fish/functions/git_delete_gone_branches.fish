function git_delete_gone_branches --description 'Deletes all git branches marked as gone'
  set deleteFlag -d
  if contains -- --force-all $argv
    echo "Force deleting all gone branches!"
    set deleteFlag -D
  end

  set branchEntries (gbg)

  if test $status -eq 1
    echo "No branches to delete" >&2
    return 0
  else if test $status -gt 1
    return $status
  end

  for branchEntry in $branchEntries
    git branch $deleteFlag (string trim $branchEntry | string replace -r '^([^\\s]+).*$' '$1')
  end
end
