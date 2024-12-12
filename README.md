Grub-mksecureboot is a script that detects partition layout of a system, generates a grub EFI image via grub-mkimage, signs grub image for secureboot and installs grub to EFI partition.

## grub-mksecureboot Usage 
```
Usage: grub-mksecureboot [option] ...
    Options:
          -h  (calls help menu)
          -d  (distro name. eg: gentoo)
          -e  (EFI path. eg: /efi)
          -b  (Boot path. eg: /boot)
          -m  (Modules included in grub, default is all. eg: [all, luks, normal])
          -k  (Machine Owner Key path eg: /root/mok)
          -c  (Put grub.cfg in memdisk)
          -g  (generate Machine Owner Keys in specified directory)
```
### Dependencies: 
Gentoo
```sh
emerge -av sys-boot/shim sys-boot/mokutil sys-boot/efibootmgr dev-libs/openssl app-arch/libarchive net-misc/wget app-shells/bash sys-boot/grub
```
Archlinux (Note: [shim-signed](https://aur.archlinux.org/packages/shim-signed) is required from the AUR.)
```sh
pacman -S mokutil efibootmgr openssl libarchive wget bash grub
```
