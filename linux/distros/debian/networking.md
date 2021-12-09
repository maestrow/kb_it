# Setup MAC address for bridge

```
auto br0
iface br0 inet static 
  address 10.4.0.3
  netmask 255.255.255.0
  gateway 10.4.0.254
  bridge_ports eth0
  bridge_stp off
  post-up ip link set br0 address 00:0a:e7:2c:44:2a
```

- https://backreference.org/2010/07/28/linux-bridge-mac-addresses-and-dynamic-ports/


Or you can use:

```
auto br1
iface br1 inet static
  bridge_hw 00:22:aa:44:bb:cc
```

source: http://wiki.debian.org/BridgeNetworkConnections