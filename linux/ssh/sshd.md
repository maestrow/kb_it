# openssh-server setup

## Resources

- https://docs.digitalocean.com/support/how-to-troubleshoot-ssh-authentication-issues/

## Setup

- `apt-get install openssh-server`
- `/etc/ssh/sshd_config`  # server configuration
- `sudo service ssh restart` # restart service after change configuration

/etc/ssh/sshd_config:
ListenAddress 0.0.0.0
Port 2222
PasswordAuthentication yes
AllowUsers  u1 u2

