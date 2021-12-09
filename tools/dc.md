# Double Commander

- https://github.com/doublecmd/doublecmd
- https://doublecmd.github.io/doc/en/commandline.html

Q: How to find config files location? A: Open in menu: Configuration \ Configuration. Look at "Location of configuration files".

## Доступ по протоколу samba

### Проблема: При попытке открыть черех //адрес/путь показывает папки как файлы нулевой длины. 

resources: 
- https://doublecmd.h1n.ru/viewtopic.php?t=6788

Соответственно нет возможноси войти в директорию.

Решение:

Можно использовать "системную" самбу из DC, достаточно ввести в строку адреса путь "smb://".