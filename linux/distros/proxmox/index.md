## Links

- [How to: Remove “You do not have a valid subscription for this server….” from Proxmox Virtual Environment/Proxmox VE (PVE 6.1-2,6.1-7,6.2-4,6.2-11,6.2-12 6.2-15 6.3-2 6.3-3 and up)](https://dannyda.com/2020/05/17/how-to-remove-you-do-not-have-a-valid-subscription-for-this-server-from-proxmox-virtual-environment-6-1-2-proxmox-ve-6-1-2-pve-6-1-2/)
- [Before I do anything on Proxmox, I do this first...](https://www.youtube.com/watch?v=GoZaMgEgrHw):

      00:00​ - Intro
      00:23​ - What are we going to talk about today?
      00:52​ - What problem are we trying to solve?
      01:26​ - Install the latest version of Proxmox
      01:51​ - How to update Proxmox without a subscription
      03:10​ - How to configure Proxmox storage (ZFS + RAID10)
      05:32​ - How to setup SMART monitoring with proxmox
      06:18​ - How to turn on PCI Passthrough with Proxmox (IOMMU)
      07:57​ - How to use VLANs with Proxmox and VLAN Aware
      09:01​ - How to set up a NFS share with Proxmox
      09:54​ - How to schedule backups with Proxmox
      10:53​ - How to back up a virtual machine on Proxmox (initial backup)
      11:13​ - How to upload the VirtIO ISO to Proxmox
      11:45​ - How to upload Windows / Ubuntu ISO to Proxmox
      11:52​ - How to create a NIC team (LACP, LAG) on Proxmox
      13:51​ - How to set up an aggregate (LACP, Team) on Unifi Switch Pro
      15:10​ - How to edit your NIC bond in Proxmox for NIC teaming
      17:26​ - How to create a virtual machine template on Proxmox
      17:59​ - How to clone a virtual machine in Proxmox
      18:42​ - How to fix Proxmox Linux clone NIC, machine ID, and ssh keys after cloning
      19:46​ - How to create a Proxmox Cluster
      21:47​ - Did I miss anything?  Let me know in the comments please!
      22:26​ - Stream Highlight - Our Discord Servers are awesome!

- [Container with physical disk](https://forum.proxmox.com/threads/container-with-physical-disk.42280/)
- [Can I convert unprivileged to privileged container?](https://forum.proxmox.com/threads/can-i-convert-unprivileged-to-privileged-container-or-otherwise-allow-use-of-security-namespace.63166/)
- [Converting an LXC container into a bootable OS](https://lists.linuxcontainers.org/pipermail/lxc-users/2011-October/002711.html)

## Факты

- Конфиги из `/etc/pve/lxc/` (формат proxmox) собираются в `/var/lib/lxc/<id>/config` (формат LXC).

## Commands

```sh
pveversion -v
ip a                       # get your IP address
service pveproxy restart   # restart web interface service
```


## LXC Container Config

- man pct.conf
- https://pve.proxmox.com/wiki/Manual:_pct.conf
- https://pve.proxmox.com/wiki/Linux_Container#pct_settings
- https://linuxcontainers.org/lxc/manpages/man5/lxc.container.conf.5.html


## `apt install acpi-support` вешает систему

Контекст: 
- Дистрибутив Ubuntu 20.10
- установка acpi-support внутри LXC конейнера в proxmox. 

Воспроизведение: При выполнении `apt install acpi-support` процесс /usr/bin/dbus-daemon потребляет почти 100% CPU. Т.о. система вешается.

Примечание: Пакет acpi-support входит в состав desktop environments: ubuntu-mate-core, xubuntu-core.

Процесс, который зависает:
      
      /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-on

Workaround: На Ubuntu 20.04 проблема не воспроизводится.