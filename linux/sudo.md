## Как не вводить пароль для команд sudo?

/etc/sudoers:

    yourusername ALL=NOPASSWD: ALL

or for specific command:

    yourusername ALL=NOPASSWD: /bin/sftp-server

## Recipes

`sudo -i` - elevate yourself to super user
`su -l <username>` - switch user
`su -` switch user to root
`sudo --validate`

### Change root password

1. Type the following command to become root user and issue passwd:

```
sudo -i
passwd
```

OR set a password for root user in a single go:

`sudo passwd root`

2. Test it your root password by typing the following command:
`su -`

source: https://www.cyberciti.biz/faq/change-root-password-ubuntu-linux/