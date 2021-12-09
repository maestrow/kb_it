## Repl

python -i <file_to_load>.py

See also:
- [How do I add tab completion to the Python shell?](https://stackoverflow.com/questions/246725/how-do-i-add-tab-completion-to-the-python-shell)


## pdb

```py
import pdb; pdb.set_trace()
```

### Enable Autocompletion

- https://stackoverflow.com/questions/15971201/autocomplete-and-tab-key-in-pdb

```py
import pdb
import rlcompleter
pdb.Pdb.complete=rlcompleter.Completer(locals()).complete

print("hello")
pdb.set_trace()
print("bye")
```