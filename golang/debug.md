## Dlv

### In docker

So you're running within a Docker container. Docker has security settings preventing ptrace(2) operations by default with in the container. Pass `--security-opt=seccomp:unconfined` to docker run when starting.

Artifacts: 

    $ dlv exec ./worker_linux_x86_64 
    $ could not launch process: fork/exec ./worker_linux_x86_64: operation not permitted


