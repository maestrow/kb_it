## Temporary failure resolving ftp.debian.org

Reproduce: `apt install <package>`
Actual Result: Temporary failure resolving ftp.debian.org
Solution: `sudo /etc/init.d/networking restart && sudo dhclient`

Source: https://qna.habr.com/q/368882