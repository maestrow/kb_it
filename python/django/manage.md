./manage.py help
./manage.py help <command>

## Migrations

    ./manage.py <command> --settings=<module> # use specific settings module
    
Migrations commands:

- makemigrations
  - --empty
  - 
- makemigrations --empty --name convert_to_utf8mb4 your_app
    --dry-run --verbosity 3
- migrate
    ./manage.py migrate my_app 0010_previous_migration 
    ./manage.py migrate my_app zero
- sqlmigrate blog 0001 # returns SQL
- showmigrations

## Start

    ./manage.py runserver [--settings module]
    ./manage.py runserver 0.0.0.0:8000 # bind to address and port. 0.0.0.0 - address, that makes http-service accessible through local network

