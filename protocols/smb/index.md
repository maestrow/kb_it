- https://wiki.debian.org/Samba/ServerSimple
- [How to configure Samba for unrestricted access from Windows clients](https://support.sgo.es/support/solutions/articles/1000265571-how-to-configure-samba-for-unrestricted-access-from-windows-clients)
- [How to Set Up a Samba Server on Debian 10 Buster](https://linuxconfig.org/how-to-set-up-a-samba-server-on-debian-10-buster)
- [How to configure Samba Server share on Debian 9 Stretch Linux](https://linuxconfig.org/how-to-configure-samba-server-share-on-debian-9-stretch-linux)


Quick info:
- sudo apt install samba samba-client
- service smbd start|stop|restart
- nano /etc/samba/smb.conf  config file

## Manage Samba users

smbpasswd -a username      # Add samba user OR change password
pdbedit -w -L              # List Samba users
pdbedit -x -u username     # Delete Samba user

При создании пользователя для самбы нужно учесть, что пользователь с таким именем должен существовать в linux. Иначе получите сообщение "Failed to add entry for user".

## Check connection from Windows

    net use # give a list of active sessions
    net use \\<samba_host>
    net use n: \\<samba_host>\<share_name> "<password>" /user:"<domain\username>" 

Delete network share:

    net use /delete n:
    net use * /delete
    net use \\omega\c$ /delete

    net session \\samba.server.ip.address /delete

Get-SMBConnection
Get-SmbConnection | Remove-SmbMapping
See: https://superuser.com/questions/1129183/disconnect-from-smb-share-with-powershell-on-windows-10

### Clear authentication cache

- https://serverfault.com/questions/326255/how-can-i-clear-the-authentication-cache-in-windows-7-to-a-password-protected
- https://social.technet.microsoft.com/Forums/en-US/5e05b556-459c-4212-8792-87de8f281617/cached-smbunc-share-credentials-how-to-remove?forum=w7itpronetworking

В моем случае не помогало ни одно решение, в том числе logout-login пользователя Windows. После того как Windows закешировал где-то пароль для подключения к общей папке самбы, чтобы убедиться, что вход осущесьвляется по паролю (а не анонимно), можно изменить временно пароль для пользователя общей папки `smbpasswd -a username`.

## Поддержка разных версий клиентов

smb.conf:

    min protocol = SMB2
    max protocol = SMB3

    client min protocol = SMB2
    client max protocol = SMB3

    client ipc min protocol = SMB2
    client ipc max protocol = SMB3

    server min protocol = SMB2
    server max protocol = SMB3