## Resources

- https://github.com/minershive/hiveos-linux
- https://github.com/minershive/hiveos-linux/tree/master/hive/sbin - всякие скрипты. Например из интересных:
  - nvidia-driver-update

## Recipes 

- [How to setup Hive OS as VM on Proxmox](https://www.reddit.com/r/Proxmox/comments/oqwriu/hive_os_on_proxmox/)

## Регистрация фермы на сайте hiveos.farm

### Как скачать rig.conf для воркера

- SignIn https://the.hiveos.farm
- Вкладка "Фермы", кликнуть на заголовке фермы
- Воркеры, кликнуь во заголовку воркера
- Вкладка "Настройки"
- Ссылка rig.conf

## Установка и запуск

https://hiveos.farm/install - Оффициальная документация и страничка загрузки образа.

### Установка на HDD

Задача: Имеется оффициальный образ [hiveos-<version>.img](http://download.hiveos.farm/latest/) (см. https://hiveos.farm/install/, раздел GPU). Это образ можно залить на HDD или флешку, полносятью перезаписав все данные на диске. Далее описывается задача установки HiveOS на отдельный раздел HDD (с сохранением других разделов и возможностью загружаться в разные ОС (dualboot)).

1. Запись образа на раздел HDD
    1. Записать образ [hiveos-<version>.img](http://download.hiveos.farm/latest/) img на флэшку с помощью dd. На флешке появится 4 раздела. 4ый - корневая ФС (/dev/sdb4).
        1. Пример: `dd if=hive-xxx.img of=/dev/sdb bs=10M status=progress`. Здесь `/dev/sdb` - диск флэшки. Будьте осторожны и укажите точное имя устройства с флешкой, для просмотра списка устройств выполните `fdisk -l`.
    1. Скопировать раздел `/dev/sdb4` (раздел с корневой ФС) на раздел HDD (например, `/dev/sda6`) `dd if=/dev/sdb4 of=/dev/sda6 bs=10M status=progress`
    1. Обновить конфигурацию загрузчика grub:
      - `update-grub` - grub напишет все найденные им загрузочный разделы, среди которых корневая ФС HiveOS.
      - `grub install /dev/sda`
1. `resize2fs /dev/sda6` - выполнить для устройства, на которое скопирован раздел с флэшки. Чтобы расширить раздел на все отведенное для него свободное место.
1. Копирование на раздел в HiveOS конфигурационного файла. Необходимо для корректной работы HiveOS.
    1. Смонтировать `mount /dev/sda6 /mnt/hive`
    1. `cp rig.conf /mnt/hive/hive-config/`
    1. После чего можно перезагружаться и загружаться с раздела HiveOS

### wifi, ssh, resize2fs

1. Включаем wifi командой wifi
1. Теперь к компу можно подключиться через ssh: `ssh user@192.168.1.104`. Пароль по умолчанию "1".
1. После записи образа на раздел, размер файловой системы на разделе /dev/sda6 равен 7Гб. Это проверяется командой df -h. Однако размер раздела может быть больше. Чтобы расширить размер файловой системы на весь раздел можно воспользоваться командой resize2fs /dev/sda6. (https://forum.hiveos.farm/t/resize-filesystem-to-fill-disk/3769)
1. Войдя через ssh, обновляем драйвера: nvidia-driver-update

## root

Для пользователя root пароль по умолчанию "1".

## Настройки после первого старта

### WiFi

`wifi` - to configure wifi on first run. После указания имени сети и пароля, настройки будут сохранены в `/hive-config/network/wifi.txt`. При следующих загрузках вайфай можно включать командой `wifi setup`.

`wifi setup` - Wifi setup from config (`/hive-config/network/wifi.txt`)

`iwconfig` - to show you wireless adapters

`ifconfig` - to check assigned IP address

- https://askubuntu.com/questions/16584/how-to-connect-and-disconnect-to-a-network-manually-in-terminal