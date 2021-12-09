# How to enable wifi on Ubuntu Server 20.04 without wired ethernet connection

Source: https://medium.com/@yping88/how-to-enable-wi-fi-on-ubuntu-server-20-04-without-a-wired-ethernet-connection-42e0b71ca198

## Preparation

### Download WPA Supplicant Package and Its Dependencies

Download wpasupplicant package with its dependencies to local storage, that can be accesses after Ubuntu Server boot (see also https://ostechnix.com/download-packages-dependencies-locally-ubuntu/).

`for i in $(apt-cache depends wpasupplicant | grep -E 'Depends|Recommends|Suggests' | cut -d ':' -f 2,3 | sed -e s/'<'/''/ -e s/'>'/''/); do sudo apt-get download $i 2>>errors.txt; done`

### Find Wireless Interface Name

    ls /sys/class/net | grep -i wlp

Alternative methods:

```bash
# Use ip command: ip link or ip addr
ip link show | grep -i wlp | awk -F: '{print $2}' | xargs
ip addr show | grep -i wlp | awk -F: '{print $2}' | xargs
# Use iw tool
iw dev | awk '$1=="Interface" {print $2}'
# Use lshw to check wireless adapters
sudo lshw -C network \
 | awk '/Wireless interface/,/logical name/ {print $3}' \
 | tail -1
```

### Netplan config `00-network.yaml`

Here provided examples of netplan config, one that use DHCP and other use static IP. Use Wireless Interface Name from previous step. Save `00-network.yaml` alongside with wpasupplicant package.

To get an IP address via DHCP:

```yaml
network:
  version: 2
  renderer: networkd
  wifis:
    wlp59s0:
      dhcp4: true
      optional: true
      access-points:
        "name": 
          password: "password"
```

To instead set a static IP address:

```yaml
network:
  version: 2
  renderer: networkd
  wifis:
    wlp59s0:
      dhcp4: no
      dhcp6: no
      optional: true
      addresses: [192.168.0.101/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]
      access-points:
        "name": 
          password: "password"

```

See the following link for additional help: https://netplan.io/examples

## After boot

### Install wpasupplicant package

`cd` to directory with wpasupplicant packages, then `sudo dpkg -i *`

### Copy Netplan

    for file in /etc/netplan/*.yaml; do mv $file{,.bak}; done;
    cp 00-network.yaml /etc/netplan

### Apply netplan config

    sudo netplan --debug generate

If everything is in order, apply the configuration provided for use:

    sudo netplan apply

Now, reboot the server:

    sudo reboot
