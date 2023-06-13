
```
echo $SHELL
cat /etc/shells
cat /etc/passwd   # last fiels is shell
chsh              # CHange SHell
```

## Run until success

    until passwd; do echo "Try again"; sleep 2; done


## sudo bash -c

history | tail -n 3 | sudo bash -c "cp /dev/stdin readme.txt"
