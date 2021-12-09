# sweb

- [База знаний](https://help.sweb.ru/)
- https://cp.sweb.ru Панель управления (Control Panel)


## SSH

Включение доступа по SSH: https://cp.sweb.ru/instruments/ssh. Включается на сутки.

Доступ по SSH открывает множество мозможностей:
- доступ к файлам по sshfs (см. далее)
- доступ к БД через проброс портов (ключ -L)
- копирование файлов через scp
- настройка bash профиля пользователя чреез ~/.profile (алиасы, функции)

Можно использовать ssh-copy-id для доступа к серверу по ключу (без ввода пароля).


## Работа с файлами

Для более удобной работы с файлами можно включить SSH (), затем воспользоваться sshfs и scp.

```
sudo mkdir /mnt/sweb
sudo sshfs -o allow_other,default_permissions root@xxx.xxx.xxx.xxx:/home/d/dir /mnt/sweb
sudo umount /mnt/sweb  # отключить
```

sudo codium --user-data-dir=/home/user/.vscode-oss /mnt/sweb

Bash Alias для запуска Double Commander в режиме sudo:

dc_sudo() { sudo doublecmd --config-dir=/home/user/.config/doublecmd "$@" </dev/null &>/dev/null & }


## Работа с БД

Можно настроить удаленное подключение к БД:
- https://cp.sweb.ru/hosting/database 
- В меню БД выбрать "Настроить удаленный доступ". 
- Добавить свой IP адрес. На страничке будет указан хост для подключения. 

Пример подключения после настройки удаленного доступа:
- `mysql --host=VHxxx.spaceweb.ru --user=$USER --password=$PASS $DBNAME`

Так же, учитывая доступность ssh, можно подключаться с пробросом нужных портов (ключ `-L [bind_address:]port:host:hostport`).


## Автоматизация деплоя

Т.к. доступен ssh, следовательно можно автоматизировать деплой.