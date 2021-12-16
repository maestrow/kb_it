#!/usr/bin/env bash

# https://stackoverflow.com/questions/454734/how-can-one-change-the-timestamp-of-an-old-commit-in-git

# git log --pretty=format:"%h %ad" --date=iso > dates.txt
# edit dates.txt
# fix-commit-time.sh dates.txt

# rewrite_commit_date(commit, date_timestamp)
#
# !! Commit has to be on the current branch, and only on the current branch !!
# 
# Usage example:
#
# 1. Set commit 0c935403 date to now:
#
#   rewrite_commit_date 0c935403
#
# 2. Set commit 0c935403 date to 1402221655:
#
#   rewrite_commit_date 0c935403 1402221655
#
rewrite_commit_date () {
  
    local commit="$1" date="$2"
    local temp_branch="temp-rebasing-branch"
    local current_branch="$(git rev-parse --abbrev-ref HEAD)"

    # if [[ -z "$date_timestamp" ]]; then
    #     date="$(date -R)"
    # else
    #     date="$(date -R --date "@$date_timestamp")"
    # fi

    git checkout -b "$temp_branch" "$commit"
    GIT_COMMITTER_DATE="$date" git commit --amend --no-edit --date "$date"
    git checkout "$current_branch"
    git rebase "$commit" --onto "$temp_branch"
    git branch -d "$temp_branch"
}


cat $1 | while read line 
do
  IFS=" " && Array=($line)
  hash=${Array[0]}
  date="${Array[1]} ${Array[2]} ${Array[3]}"
  rewrite_commit_date "$hash" "$date"
done
