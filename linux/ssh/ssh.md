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
