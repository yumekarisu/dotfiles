#! /bin/bash

echo starting pacstrap

pacstrap /mnt base base-devel linux linux-firmware efibootmgr grub osprober neovim ntfs-3g git curl wget man-db

genfstab -U /mnt >> /mnt/etc/fstab

cp after-chroot.sh /mnt

arch-chroot /mnt

