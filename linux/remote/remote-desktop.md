# Open Source Remote Desktop Protocols and Software

X-window: you ssh -X into the machine and start the app. All OpenGL stuff then gets forwarded to your local machine and OpenGL renders locally. That means you need to have the GPU resources locally. Just the CPU is used on the remote machine.

VNC: the VNC server can be run in several modes. The most common one is that the remote machine does a screenshot of the changed screen content and sends it to you. With this setting, it uses all resources on the remote machine. No need to have any OpenGL locally. This is what you want for the CUDA demos.

- https://helpful.knobs-dials.com/index.php/Remote_desktops
- [Apache Guacamole](https://guacamole.apache.org/) is a clientless remote desktop gateway. It supports standard protocols like **VNC**, **RDP**, and **SSH**. Thanks to HTML5, once Guacamole is installed on a server, all you need to access your desktops is a web browser.
- xrdp
- x2go
- SPICE

- [How to use the X2Go remote desktop with LXD containers](https://blog.simos.info/how-to-use-the-x2go-remote-desktop-with-lxd-containers/)
- [How To Set Up a Remote Desktop with X2Go on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-remote-desktop-with-x2go-on-ubuntu-20-04)
- https://www.reddit.com/r/linux/comments/98zr6i/remote_desktop_protocols_a_comparison_of_spice_nx/ 2012

x2go работает быстрее и плавнее xrdp (подключение быстрее, перетаскивание окон плавнее).


## X Window Server

Самым простым решением запуска графических программ на удаленных компьютерах является использование X Window System. Кроме того у этого решения есть одно большое преимущество: Можно иметь несколько удаленных машин (разумеется они могут представлять собой XLC контейнеры или виртуальные машины или docker-контейнеры), и в каждой машине могут быть запущены графические программы, а X Window Server может работать на ноутбуке. Т.о. на ноутбуке я могу видеть интерфейс программ, которые работают на разных машинах. 

- https://ru.wikipedia.org/wiki/X_Window_System
- https://sourceforge.net/projects/vcxsrv/
- https://techcommunity.microsoft.com/t5/windows-dev-appconsult/running-wsl-gui-apps-on-windows-10/ba-p/1493242 В данном руководстве графические приложения запускаются в подсистеме WSL, но это не имеет значения. Клиент X-Window может запускаться где угодно: в WSL или внутри LXC контейнера. Принцип работы одинаков.


## XRDP

- [How to create a template for LXC ubuntu desktop with sound](https://forum.proxmox.com/threads/how-to-create-a-template-for-lxc-ubuntu-desktop-with-sound.73695/)

Вопросы плавности и быстродействия xrdp:
- [Terrible refresh rate when a picture is viewed](https://github.com/neutrinolabs/xrdp/issues/1625)
- [RDP session is slow](https://stackoverflow.com/questions/37276637/rdp-session-is-slow)
- [RemoteFX provides you more efficient compression and performance. If you're using Windows built-in Remote Desktop Client, try 24 or 32 bit color and connection type LAN not autodetect to use RemoteFX.](https://github.com/neutrinolabs/xrdp/issues/1026#issuecomment-362796761)


### Black screen after login

Шаги для воспроизведения:
- подключиться по RDP - успешно
- `systemctl restart xrdp`
- подключиться по RDP - после логина черный экран

Причина:
При соединении по RDP на сервере создается xorg сессия. Открытые сессии можно посмотреть, выполнив:

```bash
# ps aux | grep xorg                                                                                                          root      2323  0.0  0.6 544040 53204 ?        Sl   17:13   0:02 /usr/lib/xorg/Xorg :12 -auth .Xauthority -config xrdp/xorg.conf -noreset -nolisten tcp -logfile .xorgxrdp.%s.log
root      3058  0.0  0.7 559868 59244 tty7     Ssl+ 17:17   0:00 /usr/lib/xorg/Xorg -core :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch  
root      3218  0.0  0.0   7044   868 pts/0    S+   17:17   0:00 grep --color=auto xorg
```

В этом примере видно `Xorg -core :0` - это X-сервер запущенный оконным менеджером (это можно проверить узнав процесс родителя). А `Xorg :12` - это сессия. Решением проблемы может быть остановка процесса с сессией `kill -9 <pid>` Предпологаю, что после перезапуска службы xrdp связь с существующими сессиями теряется и поэтому наблюдается такой эффект. 

## x2go

- https://www.digitalocean.com/community/tutorials/how-to-set-up-a-remote-desktop-with-x2go-on-ubuntu-20-04

    apt install x2goserver x2goserver-xsession

    service x2goserver restart

    x2go...

## VNC

- https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04

    apt install xfce4 xfce4-goodies
    apt install tightvncserver

    vncserver -help
    Xtightvnc -help

`vncserver` стартует новый процесс сервера. Для каждого процесса создается файл `~/.vnc/xfce:<number>.pid`.
vncserver -kill :<num> # завершает VNC сервер для указанной сессии.