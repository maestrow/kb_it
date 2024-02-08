# cherry-pick from another repo

```sh
cd repo1
git remote add new-repo git@github.com:org/repo.git
git remote update
git log --all --oneline --graph --decorate
git cherry-pick new-repo/main~7..new-repo/main  # cherry pick 7 last commits from new-repo
git push
```

Links:
- https://stackoverflow.com/questions/21353656/merge-git-repo-into-branch-of-another-repo
- https://stackoverflow.com/questions/35437253/how-to-git-cherrypick-all-changes-introduced-in-specific-branch
- https://stackoverflow.com/questions/37471740/how-to-copy-commits-from-one-git-repo-to-another
- https://stackoverflow.com/questions/35437253/how-to-git-cherrypick-all-changes-introduced-in-specific-branch