- https://en.wikipedia.org/wiki/Linux_startup_process
- [From Power Up To Bash Prompt](http://users.cecs.anu.edu.au/~okeefe/p2b/power2bash/power2bash.html)
- [Booting Linux: The History and the future. 2005](https://www.almesberger.net/cv/papers/ols2k-9.pdf)
- https://www.bogotobogo.com/DevOps/DevOps-Sys-Admin-Interview-Questions-Linux-Boot-Startup-Process.php
- https://www.slashroot.in/linux-booting-process-step-step-tutorial-understanding-linux-boot-sequence

## Starting scripts

- `/etc/rc.local`. The script /etc/rc.local is for use by the system administrator. It is traditionally executed after all the normal system services are started, at the end of the process of switching to a multiuser runlevel. You might use it to start a custom service, for example a server that's installed in /usr/local. Most installations don't need /etc/rc.local, it's provided for the minority of cases where it's needed.

- `.bash_profile` is executed for login shells, while `.bashrc` is executed for interactive non-login shells. When you login (type username and password) via console, either sitting at the machine, or remotely via ssh: `.bash_profile` is executed to configure your shell before the initial command prompt. But, if you’ve already logged into your machine and open a new terminal window (xterm) then `.bashrc` is executed before the window command prompt. `.bashrc` is also run when you start a new bash instance by typing `/bin/bash` in a terminal.

Shell config files such as `~/.bashrc`, `~/.bash_profile`, and `~/.bash_login` are often suggested for setting environment variables. While this may work on Bash shells for programs started from the shell, variables set in those files are not available by default to programs started from the graphical environment in a desktop session.

Lisks: 

- https://serverfault.com/questions/735621/debian-how-to-run-a-script-on-startup-without-having-to-write-30-lines-of-shell
- https://stackoverflow.com/questions/36375647/what-is-the-difference-between-etc-rc-local-and-bashrc
- https://apple.stackexchange.com/questions/51036/what-is-the-difference-between-bash-profile-and-bashrc