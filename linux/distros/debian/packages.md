- https://wiki.debian.org/PackageManagement
- `/etc/apt/sources.list` repositories, https://wiki.debian.org/DebianRepository. [use mirrors](https://unix.stackexchange.com/questions/194409/prevent-apt-get-from-using-a-specific-mirror)
- `apt-get install <package>`
- [apt-file](https://wiki.debian.org/apt-file) is a software package that indexes the contents of packages in your available repositories and allows you to search for a particular file among all available packages.

    apt-file update
    apt-file list <packagename>

    sudo apt list --installed # list installed packages

### Hold

- https://askubuntu.com/questions/18654/how-to-prevent-updating-of-a-specific-package
- dpkg --get-selections | grep hold

Unhold:

`sudo apt-mark unhold package_name` or `echo "<package-name> install" | sudo dpkg --set-selection`

## Recipes

- https://wiki.debian.org/AptCLI#List_installed_packages
- `apt-get install --only-upgrade <packagename>`
- apt-cache madison <package> # check packages version
- apt-cache policy <package>
- apt-cache search <package> # search package by name
- dpkg-query --list 'pattern*' # lists all packages that have not been purged
- dpkg-query --search 'pattern*' #searches for individual files installed
- `sudo apt-get install --reinstall <packagename>` reinstall - This completely removes the package (but not the packages that depend on it), then reinstalls the package.
- sudo apt remove --purge '^nvidia-.*'
- dpkg -i * # install all packages from current directory

This can be convenient when the package has many reverse dependencies.

### Which package owns the file?

```sh
dpkg -S <local_file>        # search in installed packages
apt-file search <filename>  # search in all registered repositories
apt-file search --regex /filename$
```

### Install deb file

sudo apt install ./name.deb

### Get details about package which isn't installed

One of:

```
dpkg --print-avail PACKAGE_NAME
apt-cache show PACKAGE_NAME
aptitude show PACKAGE_NAME
apt show PACKAGE_NAME
```

Source: https://askubuntu.com/questions/341178/how-do-i-get-details-about-a-package-which-isnt-installed

## PPA

grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*

## Cache

- https://www.cyberciti.biz/faq/can-i-delete-var-cache-apt-archives-for-ubuntu-debian-linux/
- https://ostechnix.com/download-packages-dependencies-locally-ubuntu/

- /var/cache/apt/archives


## Metapackages 

- https://itectec.com/ubuntu/ubuntu-should-i-use-tasksel-tasks-in-apt-or-install-regular-metapackages/