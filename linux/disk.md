- https://askubuntu.com/questions/662515/how-to-check-which-disk-is-mounted-where-how-to-mount-all-spare-disks
- [A better way to list partitions and mounting points](https://diego.assencio.com/?index=ffdadfc79cd5e667a65d2e325e14fee3)
- https://www.cyberciti.biz/faq/linux-disk-format/
- https://www.tecmint.com/clone-linux-partitions/

# Commands

    mount -l
    fdisk -l
    fdisk -l /dev/sda
    parted -l

    blkid

    mkfs.btrfs -L <label> /dev/sdb1

## Disk Free

    df -h

## Disk Usage

    du
    du -ah <file>

## lshw

apt install lshw

```
lshw -class disk -class storage

...
           *-disk
                description: ATA Disk
                product: ST3000DM001-1CH1
                vendor: Seagate
                physical id: 0.0.0
                bus info: scsi@3:0.0.0
                logical name: /dev/sda
                version: CC27
                serial: Z1F41BLC
                size: 2794GiB (3TB)
                configuration: ansiversion=5 sectorsize=4096
...
```

Note that device names like /dev/sdc should never be used, as this can change between reboots. Use the stable /dev/disk/by-id paths instead. Check by listing all of that directory then look for the disk added by matching serial number from lshw and the physical disk:

```
ls -l /dev/disk/by-id/ata-ST3000DM001-1CH166_Z1F41BLC
lrwxrwxrwx 1 root root 9 Jan 21 10:10 /dev/disk/by-id/ata-ST3000DM001-1CH166_Z1F41BLC -> ../../sda
```

or try

`ls -l /dev/disk/by-id | grep Z1F41BLC`

# Recieps

## Resize Partition

parted /dev/sda
...
partprobe
resize2fs /dev/sda1

source: https://askubuntu.com/questions/24027/how-can-i-resize-an-ext-root-partition-at-runtime