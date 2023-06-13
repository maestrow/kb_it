## TL/DR

- `~/.ssh/config`
- `user-id` helper function to set identity in git config
- `get-user` tool to set name and email

## Resources

- [Use Multiple SSH Keys for Git host websites (Github, Gitlab)](https://gist.github.com/alejandro-martin/aabe88cf15871121e076f66b65306610)

## core.sshCommand

- https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use

Put in your `~/.bash_aliases`:

    git-id() { git config core.sshCommand "ssh -i ~/.ssh/$1 -F /dev/null"; }

Call `git-id id_rsa` to set defailt identity.

## Run git command with different identity

- `GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_example" git clone example`

    cd /opt
    sudo GIT_SSH_COMMAND="ssh -i /home/andrew/.ssh/id_rsa" git clone http://github.com/bulletmark/cdhist


## Git User Switch

- https://github.com/geongeorge/Git-User-Switch

### Install

    npm i -g git-user-switch

### Usage

    Usage: git-user [options]

    Switch git users quickly. Switches locally by default

    Options:
      -V, --version  output the version number
      -g, --global   Switch global git user
      -d, --delete   Delete a git user from the listing
      -r, --reset    Deletes all data and resets
      -h, --help     display help for command

