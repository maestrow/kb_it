$ ifconfig
$ ifdown eth0
$ ifup eth0
$ ip a show eth0  # show ip address

### Restart network interface

$ sudo /etc/init.d/networking [restart|stop|start]

Debian/Ubuntu Linux with systemd, run:

$ sudo systemctl restart networking

### Status

$ sudo systemctl status network