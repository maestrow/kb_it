## Скачивание и установка

- Скачиваем образ
  - Заходим на сайт https://www.proxmox.com/. Выбираем Download \ Proxmox Virtual Environment \ ISO Images. [Прямая ссылка](https://www.proxmox.com/en/downloads/category/iso-images-pve).
- Записываем его на флэшку 
- Загружаемся с флэшки, устанавливаем.

## После установки

- веб интерфейс доступен на порту 8006 по https. Внимание, сертификат будет невалидным, поэтому в браузере нужно явно указать, что вы хотите продолжить и перейти на страничку. 
- ssh будет доступен по паролю root.

Далее обязятельные работы:
- SSH: Disable RootLogin, enable Pubkey Authentication
- How to update Proxmox without a subscription

## Recipes

### Настройка сети вручную

Если во время установки компьютер не был подключен к сети, тогда придется настроить сеть вручную после установки.

```sh
cd /etc/network
nano interfaces
```

Здесь можно поменять адрес и gateway. После чего перезапустить интерфейс 

```sh
ifdown $interface
ifup $interface
```

```sh
ifdown
```

Может понадобится:

```sh
ip a
```

