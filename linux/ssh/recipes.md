# SSH Recipes

## ssh-copy-id

Для копирования ключа на хост удобно использовать утилиту ssh-copy-id. Например, ssh-copy-id -p 2222 root@host. Эта команда добавит ключ из ~/.ssh/id_rsa.pub в /root/.ssh/authorized_keys.

Для первого запуска на хосте должен быть разрешен логин с паролем (PasswordAuthentication yes). После копирования ключа, логин с паролем следует запретить.

## HowTo: Root login by password

/etc/ssh/sshd_config:
- PermitRootLogin yes
- PasswordAuthentication yes

## Disable PasswordAuthentication, enable Pubkey Authentication 

- ssh-copy-id $ip
- ssh $ip
- nano /etc/ssh/sshd_config 
  - PubkeyAuthentication yes
  - PasswordAuthentication no
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