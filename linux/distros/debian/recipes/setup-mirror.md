# How to setup debian mirror

Problem: Suppose that the main repository http://deb.debian.org/debian/dists/buster/InRelease is unavailable. We need another source to install packages.

Ищем пакет [netselect](https://packages.debian.org/search?keywords=netselect&searchon=names&suite=stable&section=all).
Находим, выбираем архитектуру, зеркало, получаем ссылку: http://ftp.ru.debian.org/debian/pool/main/n/netselect/netselect_0.3.ds1-28+b1_amd64.deb

wget http://ftp.ru.debian.org/debian/pool/main/n/netselect/netselect_0.3.ds1-28+b1_amd64.deb
sudo dpkg -i netselect_0.3.ds1-28+b1_amd64.deb


https://unix.stackexchange.com/questions/338723/setup-debian-mirrors-after-installation
