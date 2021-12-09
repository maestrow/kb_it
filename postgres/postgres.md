## Resources

- [Cheat Sheet](http://www.postgresqltutorial.com/postgresql-cheat-sheet/)
- https://wiki.debian.org/PostgreSql

## Tools

- pg_ctl — initialize, start, stop, or control a PostgreSQL server
- pg_ctlcluster
- psql

Examples:

```bash
pg_ctlcluster 13 main status
```

### psql

```
\l                        -- list databases
\x on|off                 -- expanded view
explain analyze <query>;
\sf <function_name>       -- show function definition code
\! clear                  -- clear screen
```

## Recieps

### Drop DB with active connections / Close all connections

```
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'TARGET_DB_NAME'
  AND pid <> pg_backend_pid();

drop database <name>
```

### Peer authentication failed for user

source: https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge

Open `/etc/postgresql/*/main/pg_hba.conf`.

This line:

`local   all             postgres                                peer`

Should be:

`local   all             postgres                                md5`

## User Management

- https://www.a2hosting.com/kb/developer-corner/postgresql/managing-postgresql-databases-and-users-from-the-command-line
- https://severalnines.com/database-blog/postgresql-privileges-user-management-what-you-should-know
- https://www.postgresql.org/docs/8.0/sql-createuser.html
- https://www.postgresql.org/docs/9.0/sql-grant.html

- https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge
