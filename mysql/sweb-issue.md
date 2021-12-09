Среда: PHP, mySql.
Проблема: Строковые данные, полученные из БД на сайте отображаются в виде непонятных символов.

Не помню уже как были изначально настроены character set и collatin в БД. После того как столкнулся с проблемой, я поменял их для БД, всех таблиц и всех колонок [командами](./encoding.md):

Однако это не решило проблемы. Действительно, эти команды устанавливают кодировку и алгоритм сравнения, но не меняют уже записанных данных. 

Расширение [Set Character Encoding](https://chrome.google.com/webstore/detail/set-character-encoding/bpojelgakakmcfmjfilgdlmhefphglae) помогло выяснить, что данные в БД записаны в кодировке win-1251.


## Поключение через ssh

- Показывает некорректно:
  - `select name from lessons;`
  - `select name, convert(binary convert(name using cp1251) using utf8) from lessons;` Источник: https://stackoverflow.com/a/20152056/1189832
- Корректно:
  - `select name, CONVERT(CONVERT(CONVERT(name USING binary) USING cp1251) USING utf8) from lessons;` Источник: https://www.percona.com/blog/2007/12/18/fixing-column-encoding-mess-in-mysql/

### Разбираемся детально

Source: https://dev.mysql.com/doc/refman/8.0/en/charset-connection.html

Будем пробовать на стандартном консольном клиенте mysql. На клиентах phpMyAdmin и DBeaver проблему пока решить не удалось.

Ставим локально mysql client: sudo apt-get install mysql-client

Подключаемся: mysql --host=$HOST --user=$USER --password $PASS

select name from lessons;

<корректное отображение>

SELECT * FROM INFORMATION_SCHEMA.SESSION_VARIABLES
WHERE VARIABLE_NAME IN (
'character_set_server',     'collation_server',
'character_set_database',   'collation_database',
'character_set_client',
'character_set_connection', 'collation_connection',
'character_set_results'
) ORDER BY VARIABLE_NAME;

+--------------------------+-------------------+
| VARIABLE_NAME            | VARIABLE_VALUE    |
+--------------------------+-------------------+
| CHARACTER_SET_CLIENT     | cp1251            |
| CHARACTER_SET_CONNECTION | cp1251            |
| CHARACTER_SET_DATABASE   | utf8              |
| CHARACTER_SET_RESULTS    | cp1251            |
| CHARACTER_SET_SERVER     | utf8              |
| COLLATION_CONNECTION     | cp1251_general_ci |
| COLLATION_DATABASE       | utf8_unicode_ci   |
| COLLATION_SERVER         | utf8_general_ci   |
+--------------------------+-------------------+

SET CHARACTER_SET_DATABASE    = utf8;
SET CHARACTER_SET_RESULTS     = utf8;
SET CHARACTER_SET_SERVER      = utf8;
SET COLLATION_CONNECTION      = utf8_unicode_ci;
SET COLLATION_DATABASE        = utf8_unicode_ci;
SET COLLATION_SERVER          = utf8_unicode_ci;

select name from lessons;

<нечитаемые символы>

SET CHARACTER_SET_CLIENT      = cp1251;
SET CHARACTER_SET_DATABASE    = utf8;
SET CHARACTER_SET_RESULTS     = cp1251;
SET CHARACTER_SET_SERVER      = utf8;
SET COLLATION_CONNECTION      = utf8_unicode_ci;
SET COLLATION_DATABASE        = utf8_unicode_ci;
SET COLLATION_SERVER          = utf8_unicode_ci;

select name from lessons;

<корректное отображение>

## Итоговое решение

Ответ поддержки:
> По умолчанию кодировка соединения с MySQL в phpMyAdmin совпадает с кодировкой самой БД, данные, корректно сохранённые в кодировке UTF-8, будут отображаться при редактировании. Отображение одной из строк в таблице lessons (id 25) может быть связано с тем, что данные были неверно конвертированы из одной кодировки в другую, т. к. при принудительном задании кодировки UTF-8 в запросе данные в таблице отображаются так же, как и при запросе по умолчанию.

Из этого следует, что моя проблема в моем клиенте mysql - в веб-приложении. То есть мне также надо устанавливать CHARACTER_SET_CLIENT и CHARACTER_SET_RESULTS значению @@CHARACTER_SET_DATABASE. Как это делать правильно при использовании PDO я не знаю :), пока сделал так:

    public function getConn() {
      $conn = new PDO(DB_DSN, DB_USERNAME, DB_PASSWORD);
      $conn->exec("
      SET CHARACTER_SET_CLIENT = @@CHARACTER_SET_DATABASE;
      SET CHARACTER_SET_RESULTS = @@CHARACTER_SET_DATABASE;
      ");
      return $conn;
    }

Т.о. каждый запрос к БД выполняется с такими значениями переменных. 