- https://help.ubuntu.com/community/Mount
- https://help.ubuntu.com/community/Fstab
- mountpoint - see if a directory or file is a mountpoint

## One Line Recieps

- Remount /etc/fstab Without Reboot: `mount -a`. [source](https://www.shellhacks.com/remount-etc-fstab-without-reboot-linux/)

## Mount

mount /dev/sdb1 /disk1

umount can be given a device or a mount point:

    umount /mnt
    umount /dev/hda1

## Q: How to check whether device is mounted?

1. mount

2. To find out what drives are mounted you can check `/etc/mtab`, which is a list of all devices mounted on the system. It can sometimes have various tmpfs and other things you aren't looking for mounted too, so I reccomend `cat /etc/mtab | grep /dev/sd` to get only physical devices.

