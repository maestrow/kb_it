# REPL / Shell

./manage.py shell [--settings=<module>]
./manage.py shell_plus --notebook  # https://github.com/django-extensions/django-extensions

## How to execute a Python script from the Django shell

    $ ./manage.py shell < myscript.py

or

    ./manage.py shell <<EOF\ exec(open('myscript.py').read()) \EOF

You could also do:

    $ ./manage.py shell
    ...
    >>> execfile('myscript.py')

For python3 you would need to use

    >>> exec(open('myscript.py').read())

Source: https://stackoverflow.com/questions/16853649/how-to-execute-a-python-script-from-the-django-shell
