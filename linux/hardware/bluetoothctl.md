# bluetoothctl

## How to connect new device

```
bluetoothctl
scan on
... wait ...
scan off
trust <device>
... put your device in pairing mode ...
pair <device>
connect <device>
exit
```

## Remove device

```
disconnect <device>
untrust <device>
remove <device>
```

# Issues

## Failed to pair: org.bluez.Error.AuthenticationRejected

Solution:

1. Remove device (disconnect, remove)
2. Connect again (scan, pair, connect)

Source: https://askubuntu.com/questions/1240045/bluetooth-pairing-problems-ubuntu-20-04-failed-to-pair-org-bluez-error-authent


## bluetoothctl continuously scan devices

`scan off` doesn't help. 

Solution: You might have your gnome control center bluetooth GUI open, which forces the scan to be on and can apparently overwhelm bluetooth.

Source: https://askubuntu.com/questions/1277052/how-to-disable-bluetooth-continuously-scan-devices-on-ubuntu-20-04