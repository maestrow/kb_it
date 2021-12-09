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