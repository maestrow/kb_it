# SSH Agent

[addr-already-in-use]: https://stackoverflow.com/questions/5106674/error-address-already-in-use-while-binding-socket-with-address-but-the-port-num]

- [How do I get ssh-agent to work in all terminals?](https://unix.stackexchange.com/questions/132065/how-do-i-get-ssh-agent-to-work-in-all-terminals). Use `ssh-agent -a <socket>` on same socket in all terminals. `ssh-add` to add your `~/.ssh/id_rsa` to ssh-agent. 
- Problem: `ssh-agent -a "$SSH_AUTH_SOCK"` causes "Address already in use". [Solution](addr-already-in-use): `unlink $SSH_AUTH_SOCK`

Start SSH agent in the background:
```bash
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```

More commands:
```bash
killall ssh-agent; eval "$(ssh-agent -s)" # restart ssh agent
ssh-add -l
ssh-add ~/.ssh/your-private-key
kill $SSH_AGENT_PID # When you log out
```

