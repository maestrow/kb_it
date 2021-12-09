source: https://wiki.debian.org/Grub

# Grub 2

- The script snippets in `/etc/grub.d/`
- The configuration file `/etc/default/grub`

To configure grub "v2", you should edit `/etc/default/grub`, then run `update-grub`. 
Advanced configuration are achieved by modifying the snippets in `/etc/grub.d/`.

## Kernel boot parameters

- [How do I add a kernel boot parameter?](https://askubuntu.com/questions/19486/how-do-i-add-a-kernel-boot-parameter)

In `/etc/default/grub` find the line starting with `GRUB_CMDLINE_LINUX_DEFAULT`. Parameters are separated by space. Example:

```sh
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash foo=bar"
```