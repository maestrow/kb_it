- [Install Arch in QEMU and run KTSAN](https://gist.github.com/anatol/8a684de0952ac7fe031946679edea912)
- [How to Install Arch Linux [Step by Step Guide]](https://itsfoss.com/install-arch-linux/)

В примере ниже нет доступа к сети.

```
qemu-img create -f qcow2 arch.img 40G

qemu-system-x86_64 -enable-kvm \
  -cdrom ../ISO/archlinux-2023.06.01-x86_64.iso \
  -boot order=d \
  -drive file=arch.img \
  -m 4G \
  -cpu host \
  -vga virtio \
  -display sdl,gl=on \
  -netdev user,id=user.0,hostfwd=tcp::10022-:22 \
  -device e1000,netdev=user.0
  -net nic \
  -net user
```

  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::10022-:22 \