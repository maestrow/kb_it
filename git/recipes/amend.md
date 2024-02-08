# Use Case: Change file(s) in pushed commit


```bash
git rebase -i hash^
# - set `edit` action for commit you want to edit
# - Edit file(s)
git add *
git commit --amend # will show you new changes
git status
git rebase --continue
git status
git push --force
```
