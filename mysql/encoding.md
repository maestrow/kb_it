- mysql> show charset;

## Получить кодировку для БД, таблиц и колонок

Для БД:
select default_character_set_name, schema_name from information_schema.schemata;
or
SELECT * FROM information_schema.SCHEMATA WHERE SCHEMA_NAME = '<database-name>'

Для таблиц:
SHOW TABLE STATUS
или
SHOW TABLE STATUS where name like 'table_123';

Для таблиц и колонок:
SHOW CREATE TABLE mydatabase.mytable;

Source: https://stackoverflow.com/questions/1049728/how-do-i-see-what-character-set-a-mysql-database-table-column-is

## Поменять кодировку для БД, таблиц, колонок

```sql
-- Change DATABASE Default Collation
SELECT DISTINCT concat('ALTER DATABASE `', TABLE_SCHEMA, '` CHARACTER SET utf8 COLLATE utf8_unicode_ci;')
from information_schema.tables
where TABLE_SCHEMA like  'database_name';

-- Change TABLE Collation / Char Set
SELECT concat('ALTER TABLE `', TABLE_SCHEMA, '`.`', table_name, '` CHARACTER SET utf8 COLLATE utf8_unicode_ci;')
from information_schema.tables
where TABLE_SCHEMA like 'database_name';

-- Change COLUMN Collation / Char Set
SELECT concat('ALTER TABLE `', t1.TABLE_SCHEMA, '`.`', t1.table_name, '` MODIFY `', t1.column_name, '` ', t1.data_type , '(' , t1.CHARACTER_MAXIMUM_LENGTH , ')' , ' CHARACTER SET utf8 COLLATE utf8_unicode_ci;')
from information_schema.columns t1
where t1.TABLE_SCHEMA like 'database_name' and t1.COLLATION_NAME = 'old_charset_name';
```
Source: https://stackoverflow.com/questions/5906585/how-to-change-the-character-set-and-collation-throughout-a-database

