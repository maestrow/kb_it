# phpcs + VSCode

При работе с PHP кодом в VSCode есть возможность использовать линтер [PHP CodeSniffer][phpcs]. 

С общим процессом настройки связки phpcs + vscode можно ознакомиться на страничке расширения и в статье [Set Up PHP CodeSniffer for Local Development][twilio].

Для этого нужно во первых установить сам линтер, а во-вторых установить расширение. 

## Установка phpcs

`composer global require "squizlabs/php_codesniffer=*"`

Проверьте успешность установки командой `phpcs`.

Note: If you get an error similar to `command not found`, ensure that you place the Composer `bin` folder in your `PATH`. Usually `$HOME/.config/composer/vendor/bin` or `/root/.composer/vendor/bin`. Чтобы самостоятельно найти эту папку можно воспользоваться поиском `find / -name phpcs`. В контейнере поиск выполняется мгновенно. Если вы работаете с docker контейнером, то добавить этот путь к переменной среды `PATH` можно директивой `ENV PATH="/root/.composer/vendor/bin:${PATH}"` в `Dockerfile`. 

## Установка расширения [vscode-phpcs]

Ctrl+p: `ext install phpcs`

## Issue with `--stdin-path` and Xdebug

При открытии php файла в VSCode появляется сообщение от phpcs: 

> phpcs: Unknown error ocurred. Please verify that phpcs --report=json -q --encoding=UTF-8 --error-severity=5 --warning-severity=5 --stdin-path=/path/to/file.php - returns a valid json object.

В моем случае для решения проблемы понадобилось перенаправить логи xdebug в файл. См тред [issue-119]. Далее подробнее. 

Если попробовать выполнить команду, приведенную в ошибке, тогда получим ответ:

```
$ phpcs --report=json -q --encoding=UTF-8 --error-severity=5 --warning-severity=5 --stdin-path=/path/to/file.php
Xdebug: [Step Debug] Could not connect to debugging client. Tried: localhost:9000 (through xdebug.client_host/xdebug.client_port) :-(
ERROR: You must supply at least one file or directory to process.

Run "phpcs --help" for usage information
```

Для запуска той же команды из консоли нужно будет опустить ключ `--stdin-path`, а путь к файлу передать как позиционный параметр:

```
$ phpcs --report=json -q --encoding=UTF-8 --error-severity=5 --warning-severity=5 /workspaces/php-fm/src/views/main.php
Xdebug: [Step Debug] Could not connect to debugging client. Tried: localhost:9000 (through xdebug.client_host/xdebug.client_port) :-(
{"totals":{"errors":1,"warnings":0,"fixable":0},"files":{"\/workspaces\/php-fm\/src\/views\/main.php":{"errors":1,"warnings":0,"messages":[{"message":"Missing file doc comment","source":"PEAR.Commenting.FileComment.Missing","severity":5,"fixable":false,"type":"ERROR","line":1,"column":7}]}}}
```

Уже лучше - видим ответ в виде json. Однако ответ не является корректным json объектом, т.к. начало текста содержит сообщение от Xdebug. Данное предупреждение выводится даже при выполнении `phpcs --version`. 


### Перенаправим вывод Xdebug в файл логов

Для этого в php.ini укажем `xdebug.log="/var/www/log/xdebug.log"`. Внимание: указанная папка должна существовать. 

После перенаправленя логов Xdebug в файл обращение к phpcs больше не содрежит тектовых предупреждений - все они пишутся в указанный файл. Команда выше возвращает корректный json. 


### Патчим расширение, убираем ключ `--stdin-path`

Если другие методы не помогли, попробуйте пропатчить linter.js. 

Далее, чтобы заставить расширение не использовать ключ `--stdin-path` поправьте файл `/root/.vscode-server/extensions/ikappas.phpcs-1.0.5/server/src/linter.js`. Возможно у вас другой путь. Если вы в контейнере, тогда поиск `find / -name linter.js` даст результат быстро. Исправьте:

    lintArgs.push(`--stdin-path=${filePath}`);

на:

    lintArgs.push(filePath);


### Автоматизация данных исправлений для docker-контейнера

```sh
RUN composer global require "squizlabs/php_codesniffer=*" \
    && mkdir -p /var/www/log \
    && echo "xdebug.log=\"/var/www/log/xdebug.log\"" >> /usr/local/etc/php/conf.d/xdebug.ini
```

Патч linter.js пока не придумал как автоматизировать. Расширения создаются после выполнения команд из директивы [postCreateCommand][devcontainer.json]. Поэтому как-нибудь сами запустите команду :).

```bash
sed -i -e 's/lintArgs.push(`--stdin-path=${filePath}`);/lintArgs.push(filePath);/g' /root/.vscode-server/extensions/ikappas.phpcs-1.0.5/server/src/linter.js;
```

## phpcs.xml - набор правил для линтера

Поместите конфигурационный файл в корень вашего проекта и phpcs его подхватит. Возьмите этот пример, откройте php файл, напишите строку длиной более 100 символов, сохраните файл, линтер должен подстветить проблему. 

```xml
<?xml version="1.0"?>
<ruleset name="Custom Standard" namespace="MyProject\CS\Standard">
 <rule ref="Generic.Files.LineLength">
  <properties>
   <property name="lineLimit" value="40"/>
   <property name="absoluteLineLimit" value="50"/>
  </properties>
 </rule>
</ruleset>

```

## Расширения для phpcs

### phpcs-variable-analysis

- https://github.com/sirbrillig/phpcs-variable-analysis

```
composer global require dealerdirect/phpcodesniffer-composer-installer
composer global require sirbrillig/phpcs-variable-analysis
```


[phpcs]: https://github.com/ikappas/vscode-phpcs "PHP CodeSniffer for Visual Studio Code"
[twilio]: https://www.twilio.com/blog/set-up-php-codesniffer-local-development-sublime-text-php-storm-vs-code
[phpcs]: https://github.com/squizlabs/PHP_CodeSniffer
[vscode-phpcs]: https://github.com/ikappas/vscode-phpcs
[issue-119]: https://github.com/ikappas/vscode-phpcs/issues/119
[devcontainer.json]: https://code.visualstudio.com/docs/remote/devcontainerjson-reference