- https://wiki.debian.org/SSH
- ssh fs

## ssh oneliners

ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no example.com  # force passwd auth

## Client Setup

apt-get install openssh-client
ssh-keygen -t rsa                # generate the key   

### Keys location

```
~/.ssh/id_rsa
~/.ssh/id_rsa.pub
```

## Server setup

- `apt-get install openssh-server`
- `/etc/ssh/sshd_config`  # server configuration
- `sudo service ssh restart` # restart service after change configuration

/etc/ssh/sshd_config:
ListenAddress 0.0.0.0
Port 2222
PasswordAuthentication yes
AllowUsers  u1 u2

