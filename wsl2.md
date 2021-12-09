- pengwin

## Configs

/etc/wsl.conf


## X Servers for Windows

- VcXsrv X Server
- XMing
- X410

Issues:
- Q: How to change cursor size? A: `export XCURSOR_SIZE=16`. Source: https://superuser.com/questions/1196399/how-do-i-set-the-size-of-the-x-mouse-pointer-in-the-windows-subsystem-for-linux.


### x410

- https://token2shell.com/howto/x410/setting-up-wsl-for-linux-gui-apps/


## wsl - console tool

    wsl -l --running   # list running
    wsl -t WLinux      # terminate WLinux distribution
    wsl -d WLinux      # start WLinux distribution


## Problems

### VSCode doesn't start from WSL2

Solution: run terminal, from where you launch linux, as administrator.

### Can not connect to internet in WSL 2

https://github.com/microsoft/WSL/issues/4275

```
I had the same issue too. network unreachable, and nothing can connect.

The following resolved my issues:

# ifconfig eth0 netmask 255.255.240.0
# ip route add default via <WSL ethernet address>    
(For me, ipconfig shows the WSL virtual eth address as 192.168.64.1.

Explanation:

I noticed that my $ ip addr didn't quite match my \>ipconfig:

$ ip addr show eth0
4: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:15:5d:db:c0:c6 brd ff:ff:ff:ff:ff:ff
    inet 192.168.76.46/24 brd 192.168.76.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::215:5dff:fedb:c0c6/64 scope link tentative
       valid_lft forever preferred_lft forever
versus

ipconfig                                                                                                         

Windows IP Configuration

Ethernet adapter vEthernet (WSL):

   Connection-specific DNS Suffix  . :
   Link-local IPv6 Address . . . . . : fe80::f513:b32c:60d5:1200%87
   IPv4 Address. . . . . . . . . . . : 192.168.64.1
   Subnet Mask . . . . . . . . . . . : 255.255.240.0
   Default Gateway . . . . . . . . . :
Virtual ethernet has subnet mask 255.255.240.0.

So the first line changes it to the correct subnet mask.

# ifconfig eth0 netmask 255.255.240.0
For the second line, when I ran ip route, I saw:

$ ip route
192.168.64.0/20 dev eth0  proto kernel  scope link  src 192.168.76.46
Which basically means that only the 192.168.64.0/20 range is routable. Hence why network unreachable for a lot of the commands.
So the second one simply adds 192.168.64.1 as the default gateway for all routes:

# ip route add default via 192.168.64.1
Where the 192.168.64.1 matches the output of the windows ipconfig command for the WSL ipv4 address.

I don't know if this is the 100% correct approach, but it certainly fixes this issue for me.
```

```
ifconfig eth0 192.168.112.25 netmask 255.255.255.0
route add default gw 192.168.112.1
```