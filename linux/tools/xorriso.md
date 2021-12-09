    xorriso -as mkisofs -r \
      -V Ubuntu\ custom\ amd64 \
      -o $(distr) \
      -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot \
      -boot-load-size 4 -boot-info-table \
      -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot \
      -isohybrid-gpt-basdat -isohybrid-apm-hfsplus \
      -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin  \
      -graft-points \
      $(content)/boot $(content) xxx=/home/user/packages-repo