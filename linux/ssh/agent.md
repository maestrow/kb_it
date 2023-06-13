# SSH Agent

[addr-already-in-use]: https://stackoverflow.com/questions/5106674/error-address-already-in-use-while-binding-socket-with-address-but-the-port-num]

- [How do I get ssh-agent to work in all terminals?](https://unix.stackexchange.com/questions/132065/how-do-i-get-ssh-agent-to-work-in-all-terminals). Use `ssh-agent -a <socket>` on same socket in all terminals. `ssh-add` to add your `~/.ssh/id_rsa` to ssh-agent. 
- Problem: `ssh-agent -a "$SSH_AUTH_SOCK"` causes "Address already in use". [Solution](addr-already-in-use): `unlink $SSH_AUTH_SOCK`

