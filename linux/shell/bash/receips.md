
```
echo $SHELL
cat /etc/shells
cat /etc/passwd   # last fiels is shell
chsh              # CHange SHell
```

## Run until success

    until passwd; do echo "Try again"; sleep 2; done

