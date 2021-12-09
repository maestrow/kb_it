# sshfs

source: https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh

sudo apt-get install sshfs

```sh
sudo mkdir /mnt/droplet
sudo sshfs -o allow_other,default_permissions root@xxx.xxx.xxx.xxx:/ /mnt/droplet
sshfs -o allow_other,default_permissions,IdentityFile=~/.ssh/id_rsa root@xxx.xxx.xxx.xxx:/ /mnt/droplet
sudo sshfs -d -F /home/user/.ssh/config -o IdentityFile=/home/user/.ssh/id_rsa -o allow_other,default_permissions alias:/home/user /mnt/droplet/  # если используете sudo, то нужно указывать config и IdentityFile нужного пользователя (иначе будет использоваться от пользователя root).
sudo umount /mnt/droplet
```

## Permanently Mounting the Remote File System

```sh
sudo nano /etc/fstab
sshfs#root@xxx.xxx.xxx.xxx:/ /mnt/droplet # Save the changes to /etc/fstab and reboot if necessary.
```