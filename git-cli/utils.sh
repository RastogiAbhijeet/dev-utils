#!/bin/bash

# Arguments
level_one_arg=$1

delete_branch_pattern() {
  local branch_pattern=$1

  if [ "$branch_pattern" ]; then
    branches=$(git branch --list "$branch_pattern")
    if [ "$branches" ]; then
      git branch -d $branches
    else
      echo No branch matching $branch_pattern
    fi

  else
    echo "Missing branch pattern"

  fi
}

delete_feature_branches() {
  if [ $level_one_arg == 'delete-feature-branches' ]; then
    delete_branch_pattern feature/*
  fi
}

delete_fix_branches() {
  if [ $level_one_arg == 'delete-fix-branches' ]; then
    delete_branch_pattern fix/*
  fi
}

main() {
  if [ $level_one_arg == 'delete-feature-branches' ]; then
    delete_feature_branches
  elif [ $level_one_arg == 'delete-fix-branches' ]; then
    delete_fix_branches
  elif [ $level_one_arg == 'delete-branch-pattern' ]; then
    delete_branch_pattern $2
  fi
}

main $1 $2
