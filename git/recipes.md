- [Links](#links)
  - [Git CSM links](#git-csm-links)
- [Common](#common)
- [Commits](#commits)
- [Branches](#branches)
  - [Create the branch on your local machine and switch in this branch:](#create-the-branch-on-your-local-machine-and-switch-in-this-branch)
  - [Change working branch](#change-working-branch)
  - [Push the branch](#push-the-branch)
  - [Delete branch](#delete-branch)
  - [Rename branch](#rename-branch)
  - [Rename remote branch](#rename-remote-branch)
  - [Git workflow with clean master](#git-workflow-with-clean-master)
- [How to update/checkout a single file from remote origin master?](#how-to-updatecheckout-a-single-file-from-remote-origin-master)
- [Merge](#merge)
- [Squash and Merge](#squash-and-merge)
- [Rebase](#rebase)
- [Revert](#revert)
  - [Revert files permissions](#revert-files-permissions)
  - [`git clean`](#git-clean)
- [Pull from remote branch to new empty local branch. Then push local branch.](#pull-from-remote-branch-to-new-empty-local-branch-then-push-local-branch)
- [Log](#log)
- [Rebase interactive](#rebase-interactive)
- [Tags](#tags)
- [Stash](#stash)
- [Pull: `cannot locl ref` error](#pull-cannot-locl-ref-error)
- [Configurations](#configurations)
- [Diff](#diff)
- [Remote](#remote)
  - [Set upstream](#set-upstream)
  - [Show remote](#show-remote)
  - [Change remote's URL](#change-remotes-url)

## Links

- https://jonsuh.com/blog/git-command-line-shortcuts/
- [How to Duplicate a GitHub Repo with History](https://medium.com/javarevisited/how-to-duplicate-a-github-repo-with-history-e2e9b02d2ae)

### Git CSM links

- https://git-scm.com/book/en/v2/Git-Basics-Tagging

## Common

    git fetch
    git fetch -p 
    # -p, --prune After fetching, remove any remote-tracking branches which no longer exist on the remote.

    git remote show origin


## Commits
    
    git commit --amend   # edit last commit message


## Branches

    git branch -r                               # show remote branches
    git checkout --track origin/daves_branch    # checkout remote branch
    git checkout master                         # switch to local branch

### Create the branch on your local machine and switch in this branch:

    git checkout -b [name_of_your_new_branch]

### Change working branch

    git checkout [name_of_your_new_branch]

### Push the branch

    git push origin [name_of_your_new_branch]

### Delete branch

    git branch -d the_local_branch              # delete local branch
    git push origin --delete the_remote_branch  # delete remote branch
    git branch | grep -v "master\|dev" | xargs git branch -D  # delete all local branches except

### Rename branch

https://multiplestates.wordpress.com/2015/02/05/rename-a-local-and-remote-branch-in-git/

    git branch -m [old-name] new-name   # local
    git push origin :old-name new-name  # Delete the old-name remote branch and push the new-name local branch
    git push origin -u new-name         # Reset the upstream branch for the new-name local branch

### Rename remote branch

    git push origin old_name:new_name  # push local branch to remote with new_name
    git push origin --delete old_name
    git branch --set-upstream-to=origin/new_name
    git branch -vv # verify


### Git workflow with clean master

    git checkout -b my-branch1

do commits, make PR #1

    git checkout -b my-branch2   # note, that this branch is forked from my-branch1, not from master

do commits, make PR #2

Затем процесс мержа веток выглядит так:

1. PR#1 squash and merge. Это создаст 1 коммит в ветке master. Delete branch.
2. 
```
    git checkout master
    git pull
    git checkout my-branch2
    git rebase master
    git push --force
    # PR#2 squash and merge, delete branch
```
Пункт 2 повторить для каждой ветки (и PR) в цепочке.

## How to update/checkout a single file from remote origin master?

    git fetch
    git checkout origin/master -- path/to/file

Source: https://intellipaat.com/community/16018/git-how-to-update-checkout-a-single-file-from-remote-origin-master

## Merge

    git checkout master
    git fetch
    git merge origin/dev 

или 
fonts-firacode
    git pull https://url <branch-name>


## Squash and Merge

```sh
git checkout master
git merge --squash $source_branch
git commit
```

source: https://stackoverflow.com/questions/5308816/how-can-i-merge-multiple-commits-onto-another-branch-as-a-single-squashed-commit

## Rebase

Пример rebase'а ветки, сделанной от master, на текущее состояние master'а:

    git checkout master
    git pull
    git checkout you-branch
    git rebase master

## Revert

    git reset HEAD~     # revert last commit and save changes as untracked items
    git reset HEAD@{1}  # specifies the n-th prior value of that ref. For example master@{1} is the immediate prior value of master while master@{5} is the 5th prior value of master. Save changes as untracked items
    git checkout -- "proto/*"  # revert changes in files by mask
    git reset           # unstage all files, they will be removed from the staging area back to your working directory.

- [Revert last commit after push](https://christoph.ruegg.name/blog/git-howto-revert-a-commit-already-pushed-to-a-remote-reposit.html)

    git reset --hard # removes staged and working directory changes
    ## !! be very careful with these !!
    ## you may end up deleting what you don't want to
    ## read comments and manual.
    git clean -f -d # remove untracked
    git clean -f -x -d # CAUTION: as above but removes ignored files like config.
    git clean -fxd :/ # CAUTION: as above, but cleans untracked and ignored files through the entire repo (without :/, the operation affects only the current directory)

### Revert files permissions

Once in a while I mess up the files permission in a project, if you did what I did and don’t have any change or uncommitted changes then you just go reset to origin.

But if for some reason you can’t do that, here solutions for you.

```
$ git diff --summary | grep --color 'mode change 100755 => 100644' | cut -d' ' -f7- | xargs chmod 755
$ git diff --summary | grep --color 'mode change 100644 => 100755' | cut -d' ' -f7- | xargs chmod 644
```

Or you can use this magic words to restore all the permissions.

`$ git diff -p -R --no-color | grep -E "^(diff|(old|new) mode)" --color=never | git apply`

credits:
- https://newbedev.com/how-to-restore-the-permissions-of-files-and-directories-within-git-if-they-have-been-modified
- https://gilang.chandrasa.com/blog/how-to-recover-file-permission-in-git/
- https://stackoverflow.com/questions/1580596/how-do-i-make-git-ignore-file-mode-chmod-changes
- https://stackoverflow.com/questions/2517339/how-to-restore-the-permissions-of-files-and-directories-within-git-if-they-have


### `git clean`

    git clean
    
    n - show which files will be deleted
    f - force to delete
    d - remove directories
    X - remove ignored files
    x - remove ignored and non-ignored files

## Pull from remote branch to new empty local branch. Then push local branch.

git checkout --orphan NewBranch
git pull https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git RemoteBranchName
git push origin NewBranch
git push --set-upstream origin NewBranch

--orphan creates a new branch, but it starts without any commit. After running the above command you are on a new branch "NEWBRANCH", and the first commit you create from this state will start a new history without any ancestry.

See: https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/


## Log

    git log --oneline
    git cherry -v master  # changes since last branching from master


## Rebase interactive

git rebase -i <hash>   # <hash> - a commit right before problems
git rebase -i head~16  # take 16 last commits

Do not rebase commits that exist outside your repository.

Порядок редактирования коммитов в feature ветке может быть такой:
1. rebase locally
2. check
3. drop remote branch
4. push

## Tags

- https://git-scm.com/book/en/v2/Git-Basics-Tagging

    git checkout tags/n8n@1.25.1 # checkout cpecific tag
    git describe --tags          # show on which tag you are
    git tag                      # list tags
    git rev-list -n 1 v2.0.20    # show tag commit
    git branch --contains tags/v3.0.0 # show branch, containing tag

Lightweight Tags:

    git tag v0.1.1
    git push origin v0.1.1
    # OR
    git push origin refs/tags/v0.1.1

## Stash 

https://css-irl.info/how-git-stash-can-help-you-juggle-multiple-branches/


## Pull: `cannot locl ref` error

`error: cannot lock ref 'refs/remotes/origin/...': unable to create directory for .git/refs/remotes/origin/...`

решается так: `git pull origin <branch>`.

## Configurations

- core
  - filemode (set to false to ignore filemode changes)
  - autocrlf (line endings)
- user
  - name
  - email

Example:

    git config --global core.autocrlf true

## Diff

    git diff --name-only <pattern>
    git diff HEAD:full/path/to/foo full/path/to/bar
    git diff --staged *.ts # Once the changes are staged, you need to use --staged flag 

docs: https://www.specbee.com/blogs/how-create-and-apply-patch-git-diff-and-git-apply-commands-your-drupal-website

## Remote

### Set upstream

...or create a new repository on the command line
echo "# dotfiles" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:user/repo.git
git push -u origin master
                
...or push an existing repository from the command line
git remote add origin git@github.com:user/repo.git
git push -u origin master
...or import code from another repository
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.

### Show remote

```sh
$ git remote     # Showing Your Remotes
origin

$ git remote show $remote_name
$ git remote show origin         # show origin remote
$ git remote show upstream       # show upstream remote

$ git remote -v  # shows you the URLs that Git has stored for the shortname to be used when reading and writing to that remote
origin	https://github.com/schacon/ticgit (fetch)
origin	https://github.com/schacon/ticgit (push)
```

```bash
git fetch upstream --tags
```


### Change remote's URL

`git remote set-url <name> <url>`
- name: An existing remote name. For example, origin or upstream are two common choices.
- url
  - using https: https://github.com/USERNAME/REPOSITORY.git
  - using ssh: git@github.com:USERNAME/REPOSITORY.git