- https://github.com/tmux/tmux/wiki
- [Different ways to setup session configuration with windows and panes in tmux](https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened)
- [How to configure tmux session with sudo commands?](https://unix.stackexchange.com/questions/496867/have-tmux-not-ask-for-sudo-password-for-a-process-in-session-authenticate-befor)
- [A tmux Crash Course](https://thoughtbot.com/blog/a-tmux-crash-course)
- [Templating tmux with tmuxinator](https://thoughtbot.com/blog/templating-tmux-with-tmuxinator)
- [How do I reorder tmux windows?](https://superuser.com/a/552493/780471)
- https://github.com/gpakosz/.tmux.git
- [The Tao of tmux](https://leanpub.com/the-tao-of-tmux/)


## General

<p> r  reload config
<P> :  Show Tmux Internal Command Prompt

## Sessions

Commands:
```
tmux new-session -s pears
tmux attach -t apples
tmux attach #1                   # by number
tmux ls
tmux kill-session -t tmuxrox
tmux kill-session #1             # by number
```

Hotkeys:
```
<p> d     detach session
<p> s     list
<p> $     rename
```

## Windows

Hotkeys:
```
<p> c  new
C-n    next
C-p    prev
<p> w  list
<p> f  find by name
<p> ,  give a name
exit or ctrl+d  - close window
```

## Panes

Hotkeys:
```
<p> %   split vertically
<p> "   split horizontally
<p> o   cycle through panes
<p> q   select by number
<p> z   zoom to
<p> x   close
```

## Scrolling buffer

Hotkeys:
```
<p> [
```

## Copy mode

Ctrl+A+[ - enter copy mode

In copy mode:
Ctrl+S - search
Ctrl+N - next
Ctrl+Shift+N - prev

## Plugins

- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) Restore tmux environment after system restart.
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) automatic restoring and continuous saving of tmux env.
- [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat) regex searches in tmux and fast match selection.
- [tmux-yank](https://github.com/tmux-plugins/tmux-yank) enables copying highlighted text to system clipboard.
- [tmux-open](https://github.com/tmux-plugins/tmux-open) a plugin for quickly opening highlighted file or a url.