- https://www.thegeekstuff.com/2012/10/gnupg-basics/
- https://www.devdungeon.com/content/gpg-tutorial
- [How to use GPG to encrypt stuff](https://yanhan.github.io/posts/2017-09-27-how-to-use-gpg-to-encrypt-stuff.html)
- [The GNU Privacy Handbook](https://www.gnupg.org/gph/en/manual/book1.html)
- https://unix.stackexchange.com/questions/145233/how-do-i-make-gpg-agent-forget-my-passphrase-automatically
- https://superuser.com/questions/655246/are-gnupg-1-and-gnupg-2-compatible-with-each-other

```sh
gpg --gen-key
gpg --list-keys
gpg --delete-secret-keys <name>
gpg --delete-key <name>
gpg --armor --export --output lakshmanan_pubkey.gpg lakshmanan
```