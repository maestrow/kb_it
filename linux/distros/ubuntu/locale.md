# Change system language on Ubuntu 20.04 from command line

Source: https://linuxconfig.org/change-system-language-on-ubuntu-20-04-from-command-line

1. `locale` check the current system language settings
2. `sudo dpkg-reconfigure locales`. 
- Select desired languages. UTF-8 locales should be chosen by default. Other character sets may be useful for backwards compatibility with other systems and software.
- Select which language you wish to use as primary language for the entire system.
3. Log out and log in to confirm your selection by execution the `locale --all` command

## Я выбираю

```sh
$ locale --all
C.UTF-8
en_US.utf8
POSIX
ru_RU.cp1251
ru_RU.koi8r
ru_RU.utf8
russian
```

ru_RU.CP1251 CP1251
ru_RU.KOI8-R KOI8-R
ru_RU.UTF-8 UTF-8

### Скрипт

Source: https://askubuntu.com/questions/683406/how-to-automate-dpkg-reconfigure-locales-with-one-command

```bash
echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections
echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8, ru_RU.UTF-8 UTF-8, ru_RU.CP1251 CP1251, ru_RU.KOI8-R KOI8-R" | debconf-set-selections
rm "/etc/locale.gen"
dpkg-reconfigure --frontend noninteractive locales
```

См. также:

    cat /etc/locale.gen
    debconf-show locales