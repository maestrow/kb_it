# How to write ISO to USB flash?

## Step 1: Find your usb device name

```
$ df
Filesystem            1K-blocks    Used Available Use% Mounted on
udev                   16432268       0  16432268   0% /dev
tmpfs                   3288884   26244   3262640   1% /run
/dev/mapper/md0_crypt 491076512 9641092 456420380   3% /
tmpfs                  16444408  105472  16338936   1% /dev/shm
tmpfs                      5120       4      5116   1% /run/lock
tmpfs                  16444408       0  16444408   0% /sys/fs/cgroup
/dev/sdc1             122546800  124876 116153868   1% /boot
tmpfs                   3288880      24   3288856   1% /run/user/119
tmpfs                   3288880      72   3288808   1% /run/user/1000
/dev/sdd1               1467360 1467360         0 100% /media/vivek/data
```

Another option is to run dmesg command to find out usb device name:

`$ sudo dmesg`


## Step 2: Unmount

`$ sudo umount /media/vivek/data`

Or

`$ sudo umount /dev/sdd1`


## Step 3: Create a bootable USB stick on Linux

`$ sudo dd if=artful-desktop-amd64.iso of=/dev/sdd bs=1M status=progress`

## Issue: Progress not shown

When you write a file to a block device, use dd with `oflag=direct`. This uses `O_DIRECT` writes, which avoids using your RAM as a writeback cache. Note that to get good performance, `oflag=direct` usually needs a large block size.