# Ubuntu LXC in Proxmox with Docker

- Unpriveleged: false
- отключить apparmor: lxc.apparmor.profile: unconfined
Доступ к физическому диску `/etc/pve/lxc/100.conf`:
```
mp0: volume=/dev/disk/by-id/ata-WDC_WD2001FASS-00U0B0_WD-WMAUR0193931-part2,mp=/mnt/wd_ext,backup=0
```

Пример файла настроек:
```
arch: amd64
cores: 4
hostname: concourse
memory: 5000
mp0: volume=/dev/disk/by-id/ata-ST3250820AS_3QE03PQK-part1,mp=/mnt/seagate,backup=0
net0: name=eth0,bridge=vmbr0,firewall=1,gw=192.168.1.1,hwaddr=D2:DD:0D:90:10:4C,ip=192.168.1.102/24,type=veth
ostype: ubuntu
rootfs: seagate:102/vm-102-disk-0.raw,size=4G
swap: 5000
lxc.apparmor.profile: unconfined
```

Далее:
```bash
apt update
apt install net-tools    # add ifconfig
apt install mc
```

- [Настроить русский язык в консоли](/linux/distros/ubuntu/locale.md)
- RDP

# Docker in LXC

1. https://forum.proxmox.com/threads/apply-caps-operation-not-permitted-trying-to-run-wireguard-docker-ct.88971/

> We do NOT recommend running docker inside a LXC container as you are faced with multiple problems due to the limited permissions inside LXC.
If you need docker, use qemu (VM)

2. https://danthesalmon.com/running-docker-on-proxmox/

To run docker in LXC you have two options:

1. run in a privileged container or
2. enable the "nesting" and "keyctl" features for unpriveleged container.

source: https://forum.proxmox.com/threads/running-docker-containers-in-proxmox-containers.81660/

3. https://www.reddit.com/r/Proxmox/comments/g3wozs/best_way_to_run_docker_in_proxmox/



## Проблема: AppArmor не позволяет запустить docker. 

```
$ docker run hello-world
docker: Error response from daemon: AppArmor enabled on system but the docker-default profile could not be loaded: running `/usr/sbin/apparmor_parser apparmor_parser -Kr /mnt/seagate/pve_cds_docker/tmp/docker-default523008376` failed with output: apparmor_parser: Unable to replace "docker-default".  Permission denied; attempted to load a profile while confined?
```

Решение: [Удалить AppArmor](/linux/distros/ubuntu/howto/remove-apparmor.md). 

## Проблема "apply caps: operation not permitted"

```
Cannot start service worker: OCI runtime create failed: container_linux.go:380: starting container process caused: apply caps: operation not permitted: unknown
ERROR: for worker  Cannot start service worker: OCI runtime create failed: container_linux.go:380: starting container process caused: apply caps: operation not permitted: unknown
```

source: https://danthesalmon.com/running-docker-on-proxmox/

1. On the Proxmox host, edit /etc/modules-load.d/modules.conf to add the `aufs` and `overlay` kernel modules. Restart Proxmox host.

2. `/etc/pve/lxc/<id>.conf`
```
lxc.apparmor.profile: unconfined
lxc.cgroup.devices.allow: a
lxc.cap.drop:
```

3. In the container, create /etc/docker/daemon.json and make the contents:
```
{
    "storage-driver": "overlay2"
}
```

## Move data directiry

source: https://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/

```bash
service docker stop
echo '{
   "data-root": "/path/to/your/docker"
}
' > /etc/docker/daemon.json
rsync -aP /var/lib/docker/ /path/to/your/docker
mv /var/lib/docker /var/lib/docker.old
service docker start
# if everything is ok, then remove old files:
rm -rf /var/lib/docker.old
```