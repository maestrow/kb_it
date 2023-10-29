# What is the preferred Shell shebang?

Preferred:

```sh
#!/usr/bin/env bash
```

Other options:

```sh
#!/bin/bash
#!/bin/sh
#!/bin/sh -
```

- `/bin/sh` is usually a link to the system's default shell, which is often `bash`.

- You should use #!/usr/bin/env bash for [portability](https://en.wikipedia.org/w/index.php?title=Shebang_(Unix)&oldid=878552871#Portability): different *nixes put bash in different places, and using /usr/bin/env is a workaround to run the first bash found on the PATH. And [sh is not bash](https://mywiki.wooledge.org/BashGuide/CommandsAndArguments#Scripts).

resources:
- https://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang


## NodeJs Shebang

- https://alexewerlof.medium.com/node-shebang-e1d4b02f731d