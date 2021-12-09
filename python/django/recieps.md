# Links

- https://timonweb.com/posts/override-field-widget-in-django-admin-form/
- https://stackoverflow.com/questions/324477/in-a-django-form-how-do-i-make-a-field-readonly-or-disabled-so-that-it-cannot

# Recieps

## Get all loggers

```py
import logging
loggers = [logging.getLogger(name) for name in logging.root.manager.loggerDict]
```