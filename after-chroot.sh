#! /bin/bash

ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

hwclock --systohc

nvim /etc/locale.gen

locale-gen

echo "LANG=ja_JP.UTF-8" >> /etc/locale.conf

echo "yumeka-arch" >> /etc/hostname

grub-install --target=x86_64-efi /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

echo done installing base system
sleep 5

