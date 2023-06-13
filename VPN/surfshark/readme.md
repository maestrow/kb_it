# Manual connection method

> Support: I see that you are from Russia, your country has some internet restrictions, so this is why you can't connect. 🙏
But you can still connect with our manual connection method: https://support.surfshark.com/hc/en-us/articles/360011051133-How-to-set-up-manual-OpenVPN-connection-using-Linux-Terminal-

1. To install OpenVPN:
`sudo apt-get install openvpn unzip`

1. Navigating to OpenVPN folder:
`cd /etc/openvpn`

1. Download config files with:
`sudo wget my.surfshark.com/vpn/api/v1/server/configurations`

1. Unzip downloaded commands:
`sudo unzip configurations`

1. List config files:
`ls`

1. Connecting to the VPN:
`sudo openvpn [server name]`. Here enter your Auth Username and Password which you can get from your control panel: https://my.surfshark.com/vpn/manual-setup/main

1. To disconnect press:
`CTRL + C`


# Connect without entering user and password

You can place user and password right inside *.ovpn configuration file. To do that:
- put username and password (from https://my.surfshark.com/vpn/manual-setup/main) to text file (i.e. `auth.txt`), two strings: first - username, second - password.
- change `auth-user-pass` parameter to `auth-user-pass auth.txt`.

Source: https://forums.openvpn.net/viewtopic.php?t=11342

Then you can replace `auth-user-pass` to `auth-user-pass: auth.txt` in all `*.ovpn` files with command: `sudo bash -c "find . -name '*.ovpn' | xargs sed -i 's/auth-user-pass/auth-user-pass auth.txt/'"`.

Lets made a connect script, that connects to first server from mask (uk):

```sh
su -
echo 'openvpn $(set -- uk*; echo $1)' > connect
exit
sudo chmod +x connect
```

Use `sudo ./connect` to connect to uk.