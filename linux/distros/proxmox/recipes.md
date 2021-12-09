# Proxmox Recipes

## How to update Proxmox without a subscription

`nano /etc/apt/sources.list`

add:

```
# not for production use
deb http://download.proxmox.com/debian buster pve-no-subscription 
```

`nano /etc/apt/sources.list.d/pve-enterprise.list`

comment line:
`# deb https://enterprise.proxmox.com/debian/pve bullseye pve-enterprise"`

Then you can use `apt update`.

## Disable Apparmor

In LXC containers config add:
```
lxc.apparmor.profile = unconfined
```

## Mount a block device like HDD inside an LXC container

[Mount a block device like HDD inside an LXC container (specifically in proxmox 4)](https://gist.github.com/Waltibaba/93d32e32513cb2d6dbab). В этом рецепте используется устаревшая директива lxc.aa_profile, которая была заменена на lxc.apparmor.profile. 

Я выставил lxc.apparmor.profile = unconfined (см. https://pve.proxmox.com/wiki/Linux_Container#_security_considerations).

### [LXC - Cannot assign a block device to container](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/):

Highlights:

- [#1](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/post-116512) Командой `lxc-device add -n 102 /dev/sdb` можно добавить физическое устройство в контейнер. Однако эффект не сохраняется после перезагрузки.
- [#14](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/post-118023), [#15](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/post-118086). Если контейнер имеер право доступа к физическим устройствам (определяется директивами lxc.apparmor.profile, lxc.cgroup.devices.allow), то внутри контейнера можно создать device node, например:
```
mknod -m 666 /dev/sda b 8 16
mknod -m 666 /dev/sda1 b 8 17
```
- [#16](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/post-118361). Итог топикстартера. Он предлагает использовать проксмокс скрипт, создающий ноду устройства при старте контейнера. Однако в [#17](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/post-163579) описана проблема - при бэкапе контейнера пытается бэкапиться и физическое устройство. Решение в [#20](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/post-163626)
- [#20](https://forum.proxmox.com/threads/lxc-cannot-assign-a-block-device-to-container.23256/post-163626) Proxmox Staff Member указал правильный способ монтирования физических дисков в контейнере `mp0: /dev/sdc1,mp=/mnt/timeshift,backup=0`. [Mount Points](https://pve.proxmox.com/wiki/Linux_Container#pct_mount_points:~:text=The%20root%20mount%20point%20is%20configured,up%20to%20256%20additional%20mount%20points)

- описана команда `lxc-device add -n 102 /dev/sdb`, которая стала работать в `priveleged container` с указанной опцией `lxc.apparmor.profile = unconfined`.
- После:
```
lxc.apparmor.profile: lxc-container-default-with-mounting
lxc.cgroup.devices.allow: b 8:16 rwm
lxc.cgroup.devices.allow: b 8:17 rwm
```
you need to create the device node manually using mknod (inside the container):
```
mknod -m 666 /dev/sda b 8 16
mknod -m 666 /dev/sda1 b 8 17
```

## How to get path to some image or container

```sh
$ pvesm path local-lvm:vm-101-disk-0
/dev/pve/vm-101-disk-0
```

## Run xorg in LXC

xrdp может работать подключаясь к сессии xorg. 

- [XServer inside LXC container](https://discuss.linuxcontainers.org/t/xserver-inside-lxc-container/5022)
- [Setting up LXC with Intel GPU (Proxmox), keyboard, mouse and audio](https://blog.konpat.me/dev/2019/03/11/setting-up-lxc-for-intel-gpu-proxmox.html)
- [Xserver inside LXC container: xf86OpenConsole: Switching VT failed](https://discuss.linuxcontainers.org/t/xserver-inside-lxc-container-xf86openconsole-switching-vt-failed/4878)

## Run GUI in LXC

When you run a graphical (X11) application on a Linux distribution, you have on one part the client X11 libraries, and on the other the X11 server that will display the windows on a display.

The first part is quite easy; you can install, for example, firefox in a LXD container and this will pull in the necessary client X11 libraries. But when you are about to run this application, you need to choose where to show the application window, on which X11 server.

One option is to reuse your desktop’s X11 server. In that case, you would set up the container in a way that would give full access to the X11 server socket, and to the PulseAudio socket (for sound).
The easiest way to do so, is to follow this guide.

Source: https://discuss.linuxcontainers.org/t/is-it-possible-to-run-xwindow-in-a-container/2668 

Resources:

- https://forum.proxmox.com/threads/install-gui-with-lxc-container.36326/
  - https://sourceforge.net/projects/ubuntu-business-desktop-lxc/
- https://blog.simos.info/how-to-easily-run-graphics-accelerated-gui-apps-in-lxd-containers-on-your-ubuntu-desktop/
- https://forum.proxmox.com/threads/lxc-passthrough-to-already-running-container.56312/
- [Homeserver - How to make a LXC based Xubuntu 20.04 Desktop Enviroment Container with SNAP and "GPU Passthru" VA-API (Intel i915)](https://forum.proxmox.com/threads/homeserver-how-to-make-a-lxc-based-xubuntu-20-04-desktop-enviroment-container-with-snap-and-gpu-passthru-va-api-intel-i915.76406/)
- [Journey to Deep Learning: Nvidia GPU passthrough to LXC Container](https://medium.com/@MARatsimbazafy/journey-to-deep-learning-nvidia-gpu-passthrough-to-lxc-container-97d0bc474957)

## Populating /dev in LXC

So LXC 4.0 just came out and has this in the changelog:

allow to mount /sys rw in unprivileged containers
With new kernel work done by the LXD team it is now possible to send uevents inside user namespaces. This means it is time to let udev run inside containers. A pre-condition for this is that /sys is mounted rw . If it is not udev will refuse to start.

Will this allow us to create desktop environments in LXC containers more easily?

Source: https://discuss.linuxcontainers.org/t/xserver-inside-lxc-container/5022/5

Resources: 
- https://discuss.linuxcontainers.org/t/automatically-populating-dev-in-a-highly-privileged-container/7673

## Check if a LXC container is privileged or not?

source: https://forum.proxmox.com/threads/privileged-versus-unprivileged-lxc.41733/

you can check it in the lxc.config located at `/var/lib/lxc/$VMID/config`.

If it is an unprivileged container you see this 2 lines:
```
lxc.idmap = u 0 100000 65536
lxc.idmap = g 0 100000 65536
```
