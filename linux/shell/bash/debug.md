Sources:
- [Debugging Bash scripts](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_03.html)

```bash
bash -x            # set debugging mode on for all next commads
bash +x            # set debugging mode off for all next commads
bash -x script1.sh # debug script
```

Debugging on part script:
```bash
set -x			# activate debugging from here
w
set +x			# stop debugging from here
```


set -x or set -o xtrace expands variables and prints a little + sign before the line.
set -v or set -o verbose does not expand the variables before printing.
Use set +x and set +v to turn off the above settings.


`set -e` - stop on 1st error. See: http://web.archive.org/web/20110314180918/http://www.davidpashley.com/articles/writing-robust-shell-scripts.html
