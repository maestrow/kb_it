## JSON


```py
import json

data = {
 'name' : 'ACME',
 'shares' : 100,
 'price' : 542.23
}

json_str = json.dumps(data)
data2 = json.loads(json_str) # back to object

# Writing JSON data
with open('data.json', 'w') as f:
 json.dump(data, f)

# Reading data back
with open('data.json', 'r')
  data = json.load(f)
```

### `urllib.request`, load json from string, pprint

```
>>> from urllib.request import urlopen
>>> import json
>>> u = urlopen('http://search.twitter.com/search.json?q=python&rpp=5')
>>> resp = json.loads(u.read().decode('utf-8'))
>>> from pprint import pprint
>>> pprint(resp)
{'completed_in': 0.074,
 'max_id': 26404323069224550
```

## Stdin & Stdout

for name in map(str.rstrip, sys.stdin):
addnstr()
for name in (line.rstrip("\r\n") for line in sys.stdin):

for l in filter(fn_filter, map(str.rstrip, sys.stdin)):

## Requests

- https://2.python-requests.org/en/v0.10.6/user/advanced/

## Named tuples

source: https://docs.python.org/2/library/collections.html#collections.namedtuple

    from collections import namedtuple
    MyStruct = namedtuple("MyStruct", "field1 field2 field3")

