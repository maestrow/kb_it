## Strings

```python
"".join(characters)  # efficient strings concatenation 
r'\nraw'  # Both string and bytes literals may optionally be prefixed with a letter 'r' or 'R'; such strings are called raw strings and treat backslashes as literal characters. https://docs.python.org/3/reference/lexical_analysis.html
```

## Lists

- all
- any
- map
- filter
- sum
- sorted
- zip(list1, list2)
- dic([('a', 1), ('b', 2)])

List generator:
- m = [x ** 2 for x in range(5)]
- common_nums = [a for a in list_a for b in list_b if a == b]

Выражение-генератор:
- sum((i * i for i in range(1, 100000000)))
- https://towardsdatascience.com/reduce-memory-usage-and-make-your-python-code-faster-using-generators-bd79dbfeb4c

enumerate:
- for index, num in enumerate([12, 3, 6])

modules: itertools, collections.

## Sets

set([1, 1, 2, 3, 4]) & set([2, 2, 3, 5])

## Time

### module time

time.clock()

## Type annotations

### Annotate lambda

    from typing import Callable
    func: Callable[[str, str], int] = lambda var1, var2: var1.index(var2)

## Reflection 

    dir(object)     # Object members
    type(variable)  # Type information

