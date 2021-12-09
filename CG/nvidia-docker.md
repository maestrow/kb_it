# Как из docker контейнера получить доступ к GPU?

System info: 
- Ubuntu 20.04

Быстрый тест: 
- Выполните `docker run --gpus all nvidia/cuda:10.0-base nvidia-smi`
- Если вы получите: `could not select device driver "" with capabilities: [[gpu]].`, то данная инструкция поможет настроить host-систему и docker соответствующим образом.

Инструкция:
1. Установить [Nvidia Display Drivers](https://www.nvidia.com/en-us/drivers/unix/). Может пригодиться [инструкция](https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-20-04-focal-fossa-linux)
1. Установить [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker/)
