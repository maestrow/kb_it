## venv

- `python3 -m venv ./venv` # create venv
- `source ./venv/bin/activate` # activate

Next:
- `pip freeze > requirements.txt`
- `pip install -r requirements.txt`

## virtualenv

- https://virtualenv.pypa.io/

virtualenv is a tool to create isolated Python environments. Since Python 3.3, a subset of it has been integrated into the standard library under the venv module. The venv module does not offer all features of this library, to name just a few more prominent:

- is slower (by not having the app-data seed method),
- is not as extendable,
- cannot create virtual environments for arbitrarily installed python versions (and automatically discover these),
- is not upgrade-able via pip,
- does not have as rich programmatic API (describe virtual environments without creating them).

### Use different Python version with virtualenv 

- https://stackoverflow.com/questions/1534210/use-different-python-version-with-virtualenv

virtualenv --python=/usr/bin/python2.6 <path/to/new/virtualenv/>