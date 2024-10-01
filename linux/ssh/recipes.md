# SSH Recipes

- [SSH Recipes](#ssh-recipes)
  - [ssh-copy-id](#ssh-copy-id)
    - [For other users](#for-other-users)
  - [HowTo: Root login by password](#howto-root-login-by-password)
  - [Disable PasswordAuthentication, enable Pubkey Authentication](#disable-passwordauthentication-enable-pubkey-authentication)
  - [HowTo: Pubkey Authentication](#howto-pubkey-authentication)
    - [Troubleshooting](#troubleshooting)
  - [Download \& Upload using SSH](#download--upload-using-ssh)
    - [Download a file from server using SSH](#download-a-file-from-server-using-ssh)
    - [Upload](#upload)
  - [Tunnel](#tunnel)

## ssh-copy-id

Для копирования ключа на хост удобно использовать утилиту ssh-copy-id. Например, ssh-copy-id -p 2222 root@host. Эта команда добавит ключ из ~/.ssh/id_rsa.pub в /root/.ssh/authorized_keys.

Для первого запуска на хосте должен быть разрешен логин с паролем (PasswordAuthentication yes). После копирования ключа, логин с паролем следует запретить.

### For other users

source: https://superuser.com/questions/603301/install-public-key-via-ssh-copy-id-for-other-users

```bash
$home="..." \
$user="..." \
cat ~/.ssh/id_rsa.pub | \
ssh $host "sudo mkdir -p /home/$user/.ssh; sudo tee -a /home/$user/.ssh/authorized_keys"
```

One more example:

```bash
cat ~/.ssh/id_rsa.pub | \
  ssh pi@192.168.1.25 \
  "sudo mkdir -p /root/.ssh; sudo tee -a /root/.ssh/authorized_keys"
```

## HowTo: Root login by password

/etc/ssh/sshd_config:
- PermitRootLogin yes
- PasswordAuthentication yes

## Disable PasswordAuthentication, enable Pubkey Authentication 

- ssh-copy-id [-i $identity_file] $ip
- ssh $ip
- nano /etc/ssh/sshd_config 
  - PubkeyAuthentication yes
  - PasswordAuthentication no
  - PermitRootLogin no
- service ssh restart

## HowTo: Pubkey Authentication

/etc/ssh/sshd_config:
- AuthorizedKeysFile  .ssh/authorized_keys .ssh/authorized_keys2
- PermitRootLogin yes
- PubkeyAuthentication  yes

.ssh/authorized_keys - Путь до файла с разрешенными ключами. Это файл в домашней директории того пользователя, под которым будут производиться попытки входа. Например, если вы хотите разрешить вход с использованием ключа под пользователем root, то вам нужно добавить ключ в файл /root/.ssh/authorized_keys.

Для копирования ключа на хост удобно использовать утилиту [ssh-copy-id](#ssh-copy-id)

After successfull PubkeyAuthentication setup update this:
- PasswordAuthentication no

Для пользователя, для которого вы хотите разрешить авторизацию по ключу, на сервере добавьте публичный ключ в ~/.ssh/authorized_keys. Обратите внимание на опцию AuthorizedKeysFile (в ней устанавливается ). 

### Troubleshooting

- On client:
  - Use -vv key to view logs: `ssh -vv user@host`
  - telnet <address> <port>
- On server:
  - tail -f /var/log/auth.log

Links:
- https://unix.stackexchange.com/questions/131886/ssh-public-key-wont-send-to-server

## Download & Upload using SSH

### Download a file from server using SSH

    scp <host>:/path/to/remote.file /path/on/local  # host - host name from ~/.ssh/config

    scp -F %userprofile%/.ssh/config <host_name>:/path/to/remote.file /path/on/local
    scp your_username@remotehost.edu:foobar.txt /local/dir
    scp -i key_file.pem your_username@remotehost.edu:/remote/dir/foobar.txt /local/dir
    ssh host 'cat /path/on/remote' > /path/on/local

### Upload

    scp cool_stuff.txt user@example.com:/this/path/right/here

## Tunnel

    ssh -i /path/my-key-pair.pem username@instance-id -L localport:targethost:destport
