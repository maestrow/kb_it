## could not select device driver "" with capabilities: [[gpu]].

Run: `docker run -it --rm --gpus all ubuntu nvidia-smi`
Get: `could not select device driver "" with capabilities: [[gpu]].`

### Solution

- https://github.com/NVIDIA/nvidia-docker/

More Links:
- http://collabnix.com/introducing-new-docker-cli-api-support-for-nvidia-gpus-under-docker-engine-19-03-0-beta-release/
- https://github.com/NVIDIA/nvidia-container-runtime


## Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock

Run: `docker ps` or any other docker cli command, that needs connect to docker service.
Get: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock.

Reason: Пользователь, из-по которого выполняются команды не входит в группу docker

Solution: 
- sudo usermod -a -G docker alice
- grep docker /etc/group
- newgrp docker
- relogin

Source: https://stackoverflow.com/questions/47854463/docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socke