# chmod

- https://askubuntu.com/questions/29589/chmod-ux-versus-chmod-x


## Syntax

```
1. chmod [OPTION]... MODE[,MODE]... FILE...
2. chmod [OPTION]... OCTAL-MODE FILE...
3. chmod [OPTION]... --reference=RFILE FILE...

MODE := [target] operator permission
      | target operator source

target, source := [ugoa]+
operator := [-+=]
permission := [rwxX]+

OCTAL-MODE := [0-7][0-7][0-7] # for: user, group, others
```

**target, source**:
- (`u`)ser - owner
- (`g`)roup
- (`o`)thers
- (`a`)ll

**operator**: `-` remove, `+` add, `=` set permission

**permission**: (`r`)ead, (`w`)rite, e(`x`)ecute, `X` - execute with special meaning (see below).

For directories execution permission means permission to enter the directory.

Upercase `X` means just regular execution permission, but has scecial behaviour for adding that permission:
- If the file is a directory, then it sets the executable attribute (which means permission to enter the directory).
- If the file is a regular file, then it does not add the executable attribute to its permissions, unless it already has it enabled, in which case it retains it.

**octal permissions**: `ugo` - three octal digits: first for (`u`)ser (owner), second for (`g`)roup and third for (`o`)thers. Didit value meaning could be memorized using binary format: `rwx` - three binary digits define permission (0 - no permission, 1 - has permission) corresponding to (`r`)ead, (`w`)rite and e(`x`)ecute operations. 

**octal `ugo/rwx` examples**:
```
       U   G   O
ugo = rwx rwx rwx 
777 = 111 111 111 = Full access for all
605 = 110 000 101 = owner can read, write. Group has no permissions. Others can read and execute.
```

## Examples

```
chmod -R u+rwX,go+rX,go-w /path
chmod -R u=rwX,g=rX,o=rX testdir
```


## Recipes

### How to recursively chmod all directories except files?

source: https://superuser.com/questions/91935/how-to-recursively-chmod-all-directories-except-files

- To recursively give directories read&execute privileges:

`find /path/to/base/dir -type d -exec chmod 755 {} +`

- To recursively give files read privileges:

`find /path/to/base/dir -type f -exec chmod 644 {} +`

- A common reason for this sort of thing is to set directories to 755 but files to 644. In this case there's a slightly quicker way than nik's find example:

`chmod -R u+rwX,go+rX,go-w /path`