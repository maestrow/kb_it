#!/bin/sh

# - https://stackoverflow.com/questions/750172/how-do-i-change-the-author-and-committer-name-email-for-multiple-commits
# - https://schacon.github.io/git/git-filter-branch.html

# Usage: 
#
# OLD_EMAIL=old@email.com \
# CORRECT_NAME=github_name \
# CORRECT_EMAIL=someone@users.noreply.github.com \
# ./rewrite-author.sh path/to/repo HEAD~2..HEAD

revList=${2:-"--branches --tags"}

cd $1

git filter-branch --force --env-filter '
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- $revList