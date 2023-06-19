# KVM

Для управления виртуальными машинами [KVM][linux-kvm] существует [множество](https://www.linux-kvm.org/page/Management_Tools) утилит, основные из них:
- [virt-manager][virt-manager]
- [qemu][qemu]
- [virsh](http://libvirt.org/)
- Proxmox VE

[linux-kvm]: https://www.linux-kvm.org/
[virt-manager]: https://virt-manager.org/
[qemu]: https://www.qemu.org/

- man kvm

## How To

### Setup Bridge Network

- https://www.linux-kvm.org/page/Networking
- https://levelup.gitconnected.com/how-to-setup-bridge-networking-with-kvm-on-ubuntu-20-04-9c560b3e3991
- https://devtutorial.io/how-to-setup-bridged-networking-for-kvm-in-ubuntu-20-04.html

- https://netplan.io

sudo netplan apply

### Доступ к ISO образу

Опция `-cdrom image.iso` в моем случае не срабатывала. Сработала `-drive file=image.iso,format=raw,cache=none,if=virtio`. После чего в гостевой ОС нужно найти блочное устройство (`sudo fdisk -l`) и примонтировать его `sudo mount -r /dev/... /mnt/...`. 

### Share directory

Для организации доступа из гостевой ОС к директории на хостовой ОС есть следующие варианты:
- 9p
- smb

#### 9p

- https://www.linux-kvm.org/page/9p_virtio
- https://wiki.qemu.org/Documentation/9psetup

Пример: 

Опция для запуска kvm:
`-fsdev local,security_model=passthrough,id=fsdev0,path=/tmp/shared -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare`

В гостевой ОС: `sudo mount -t 9p -o trans=virtio,version=9p2000.L hostshare ./host`

#### SMB

- https://techpiezo.com/linux/shared-folder-in-qemu-virtual-machine-linux/
- https://itectec.com/unixlinux/qemu-windows-guest-without-internet-but-with-a-shared-folder/

### Guest with ssh access, but restricted network access

Задача: Isolated Guest, it will not be able to contact the host and no guest IP packets will be routed over the host to the outside. Но в то же время должен быть доступ к гостевой ОС по ssh.

man qemu-system, Искать: restrict. 

restrict=on|off

> If this option is enabled, the guest will be isolated, i.e. it will not be able to contact the host and no guest IP packets will be routed over the host to the outside. This option does not affect any explicitly set forwarding rules.

Т.о. можно в одном ключе `-netdev` можно использовать опцию `hostfwd` и `restrict=on`, чтобы запустить виртуалку изолированно (без доступа в сеть), но при этом с проброшенными портами (например, для доступа по ssh). Пример такой конфигурации: `-netdev user,id=user.0,hostfwd=tcp::10022-:22,restrict=on -device e1000,netdev=user.0`.


### Install Ubuntu on qemu Tutorial

Source: https://www.makeuseof.com/install-ubuntu-virtual-machine-with-qemu/

Create a virtual disk image file that's 20GB in size:

    qemu-img create -f qcow2 Image.img 20G

Start virtual machine:

    qemu-system-x86_64 -enable-kvm -cdrom ubuntu.iso -boot menu=on -drive file=Image.img -m 4G -cpu host -vga virtio -display sdl,gl=on

Press Escape to open the boot menu and select the appropriate option to boot from the ISO file.
After installing Ubuntu, make sure you remove the -cdrom flag from the qemu command. This will boot Ubuntu from the disk image file rather than the ISO file.

    qemu-system-x86_64 -enable-kvm -boot menu=on -drive file=Image.img -m 4G -cpu host -vga virtio -display sdl,gl=on
