Resources: 
- [How to share files between a Linux and Windows computer](https://www.computerhope.com/issues/ch001636.htm)
- [Доступ - [решено] Сетевой smb-доступ к общей папке Windows: NT_STATUS_ACCOUNT_RESTRICTION](http://forum.oszone.net/post-2751426.html)

Для Windows:
- По умолчанию учётным записям без пароля доступ по сети запрещён (это регулируется локальной политикой безопасности LimitBlankPasswordUse).

Варианты настройки доступа с linux машины:
- `smbclient //ComputerName/ShareName -U Username`
- Nautilus: `smb://ComputerName/ShareName`
- `mount -t cifs //server/share /mnt/server --verbose -o user=UserName,dom=DOMAIN`