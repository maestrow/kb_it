- https://unix.stackexchange.com/questions/218163/how-to-install-cuda-toolkit-7-8-9-on-debian-8-jessie-or-9-stretch

## Problems

### could not select device driver

Command: `docker run --gpus all nvidia/cuda:9.0-base nvidia-smi`

Result: `could not select device driver "" with capabilities: [[gpu]]`

Solution: install nvidia-container-runtime. Details [here](https://collabnix.com/introducing-new-docker-cli-api-support-for-nvidia-gpus-under-docker-engine-19-03-0-beta-release/)