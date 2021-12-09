Source:
- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles) or watch same authors' video [Git Bare Repository - A Better Way To Manage Dotfiles](https://www.youtube.com/watch?v=tBoLDpTWVOM)

## Pre and Post

### `pre.sh`
```sh
cd ~
cat <<EOT >> config
#!/bin/bash
/usr/bin/git --git-dir=\$HOME/.cfg --work-tree=\$HOME "\$@"
EOT
chmod +x config
```

### `post.sh`
```sh
~/config config --local status.showUntrackedFiles no
```

## Scenarios

Usage:
1. pre.sh
1. scenario script
1. post.sh

### `setup-new.sh`
```sh
cd ~
mkdir .cfg
git init --bare .cfg
```

### `clone.sh`
```sh
cd ~
git clone --bare git@github.com:maestrow/dotfiles.git .cfg
mkdir -p .config-backup
~/config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    ~/config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
~/config checkout
```
