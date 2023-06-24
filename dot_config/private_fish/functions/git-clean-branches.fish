function git-clean-branches --description "remove branches that don't track remote"
  git fetch -p
  git branch -vv | grep ': gone]' |  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -D
end
