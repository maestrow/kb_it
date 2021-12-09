# XDMCP 

- https://www.x.org/releases/X11R7.6/doc/libXdmcp/xdmcp.html
- [XDMCP](https://helpful.knobs-dials.com/index.php/XDMCP_notes)

1. Проверить на хосте, что display manager запущен
  1. Выяснить какой DM установлен по умолчанию ([source](https://unix.stackexchange.com/questions/20370/is-there-a-simple-linux-command-that-will-tell-me-what-my-display-manager-is))
    - `cat /etc/X11/default-display-manager` - Debian/Ubuntu
    - `cat /etc/sysconfig/desktop` - RedHat (should also apply to Fedora)
    - `cat /etc/sysconfig/displaymanager` - OpenSuSe
  2. `ps -eaf | grep dgm3` Вместо dgm3 подставьте имя сервиса вашего DM, полученного на шаге 1. 
2. Проверить доступность подключения к серверу XDMXP по UDP. Если порт 117 не отвечает, проверьте весь диапазон портов. Например gdm3 по умолчанию использует 177 порт. Если проверка черезь сеть не прошла, проверьте порты на хосте, где работает XDMCP.
  - `netstat -unlp` на хосте покажет какие порты открыты. -u - show UDP ports, -n - show numerical addressses instead of resolving hosts. -l - show only listening ports, -p - show PID of listener's process.
  - netcat. Работает медленно.
    - `nc -zvu ${host} 117` проверить порт 117
    - `nc -zvu 192.168.1.56 1-65535` - проверить диапазон. очень медленно.
  - nmap. 
    - `nmap -sUV -T4 -p 117 --version-intensity 0 ${host}` проверить конкретный порт -p.
    - `nmap -sUV -T4 -F --version-intensity 0 ${host}` -sU - scan UDP, -sV - version detection. -T4 - for faster execution. -F - fast mode. 
3. Поключитесь к серверу
  - `X -query ${SERVER_IP}`
  - `VcXsrv -query ${SERVER_IP}`. Работает очень медленно. После ввода пароля - черный экран.

