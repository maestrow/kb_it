Check your identity at github: `ssh -T ssh@github.com`

## Issue: ssh@github.com: Permission denied (publickey)

```bash
~$ ssh -T ssh@github.com
ssh@github.com: Permission denied (publickey).
```

Troubleshooting: https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey

Solution:

```bash
~$ killall ssh-agent; eval "$(ssh-agent -s)"
Agent pid 15144
~$ ssh-add -l
The agent has no identities.
~$ ssh-add ~/.ssh/your-private-key
Enter passphrase for /home/user/.ssh/your-private-key: 
Identity added: /home/user/.ssh/your-private-key
~$ ssh-add -l
4096 SHA256:...
~$ ssh -T git@github.com
Hi user-name! You've successfully authenticated, but GitHub does not provide shell access.
```
