# Strings interpolation

source: https://realpython.com/python-string-formatting/#2-new-style-string-formatting-strformat

## Old Style String Formatting (% Operator)

>>> 'Hello, %s' % name
"Hello, Bob"

>>> 'Hey %s, there is a 0x%x error!' % (name, errno)
'Hey Bob, there is a 0xbadc0ffee error!'

>>> 'Hey %(name)s, there is a 0x%(errno)x error!' % {
...     "name": name, "errno": errno }
'Hey Bob, there is a 0xbadc0ffee error!'

## New Style String Formatting (str.format)

>>> 'Hello, {}'.format(name)
'Hello, Bob'

>>> 'Hey {name}, there is a 0x{errno:x} error!'.format(
...     name=name, errno=errno)
'Hey Bob, there is a 0xbadc0ffee error!'

## String Interpolation / f-Strings (Python 3.6+)

>>> a = 5
>>> b = 10
>>> f'Five plus ten is {a + b} and not {2 * (a + b)}.'
'Five plus ten is 15 and not 30.'

>>> def greet(name, question):
...     return f"Hello, {name}! How's it {question}?"
...
>>> greet('Bob', 'going')
"Hello, Bob! How's it going?"

## Template Strings (Standard Library)

>>> from string import Template
>>> t = Template('Hey, $name!')
>>> t.substitute(name=name)
'Hey, Bob!'