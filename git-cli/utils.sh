delete_feature_branches () {
  args2=$2
  git branch -d $(git branch --list $(pattern))
}

echo $1, $2
