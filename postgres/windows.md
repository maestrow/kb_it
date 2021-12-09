# Postgres on Windows

- `C:\Program Files\PostgreSQL\10`
- `psql -U postgres`, `postgres`

## Q & A

### Как изменить язык сообщений

В `postgresql.conf` установить: `lc_messages = 'English_United States.1252'`

    set LC_MESSAGES=English
