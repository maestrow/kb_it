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


## ssh agent

[addr-already-in-use]: https://stackoverflow.com/questions/5106674/error-address-already-in-use-while-binding-socket-with-address-but-the-port-num]

- [How do I get ssh-agent to work in all terminals?](https://unix.stackexchange.com/questions/132065/how-do-i-get-ssh-agent-to-work-in-all-terminals). Use `ssh-agent -a <socket>` on same socket in all terminals. `ssh-add` to add your `~/.ssh/id_rsa` to ssh-agent. 
- Problem: `ssh-agent -a "$SSH_AUTH_SOCK"` causes "Address already in use". [Solution](addr-already-in-use): `unlink $SSH_AUTH_SOCK`

