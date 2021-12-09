# Configure initramfs ssh server

Search: Организация ssh доступа для ввода пароля для диска до загрузки ОС

source: https://help.ubuntu.ru/wiki/unlock_luks_ssh

Запрос для поиска в гугле: [initramfs ssh server](https://www.google.com/search?q=initramfs+ssh+server).

## Краткая инструкция

1. `sudo apt install dropbear`. Dropbear is a relatively small SSH server and client.

2. Конвертируем хостовый ssh ключ в формат dropbear и копируем его в `/etc/initramfs-tools/etc/dropbear/`. Чтобы клиент при подключении к хосту по ssh всегда получал один ключ: как при подключении к серверу `dropbear` до полной загрузки ОС, так и при подключении к стандартному `openssh-server`. Если ключ будет разный, то клиент будет выдавать предупреждение `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!`.

```
sudo /usr/lib/dropbear/dropbearconvert openssh dropbear /etc/ssh/ssh_host_rsa_key /etc/dropbear/dropbear_rsa_host_key
sudo cp /etc/dropbear/dropbear_rsa_host_key /etc/initramfs-tools/etc/dropbear/
```

3. Так как `initrd` будет содержать только пользователя `root`, последний должен быть активирован: 

`sudo passwd root`

4. Если мы захотим проходить аутентификацию с помощью открытого ключа, то должны сделать, чтобы рамдиск принимал его: 

`sudo cp ~/.ssh/authorized_keys /etc/initramfs-tools/root/.ssh/authorized_keys`

