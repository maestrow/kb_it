# The Tao of tmux

- source: https://leanpub.com/the-tao-of-tmux/read


- Multiple Servers: 
  - `tmux -L moo` - connect to server under socket name “moo” and attach a new session. Create server if none already exists for socket.
  - `tmux -L moo attach` will attempt to re-attach a session if one exists.
  - The default name for the server is default, which is stored as a socket in /tmp. The default directory for storing this can be overridden via setting the TMUX_TMPDIR environment variable.

- I usually `set -g base-index 1` in my tmux configuration, since 0 is after 9 on the keyboard.

- tmux pipe-pane -o 'cat >>~/output.#I-#P'


# Command line 

# Apps

vim, top, htop, ncmpcpp, irssi, weechat, mutt
bitlbee