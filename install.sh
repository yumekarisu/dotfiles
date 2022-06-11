#! /bin/bash

cd

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd

x11="xorg-server xorg-xinit xorg-xsetroot"
audio="pipewire pipewire-pulse pipewire-alsa pipewire-jack lib32-pipewire lib32-pipewire-jack wireplumber pavucontrol"
graphics="mesa lib32-mesa xf86-video-amdgpu vulkan-intel vulkan-radeon lib32-vulkan-intel lib32-vulkan-radeon libva-intel-driver libva-mesa-driver mesa-vdpau"
fonts="ttf-dejavu ttf-liberation noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts otf-ipafont ttf-sazanami ttf-hanazono"
wm="bspwm sxhkd polybar alacritty lxappearance nitrogen dunst maim xclip network-manager-applet xdg-utils xdg-user-dirs"
file="pcmanfm gvfs xarchiver gvfs-mtp gvfs-gphoto2 gvfs-afc gvfs-smb tumbler poppler-glib ffmpegthumbnailer freetype2 libgsf evince gnome-epub-thumbnailer unzip unrar"
apps="mpv qbittorrent neovim htop radeontop"
polkit="polkit polkit-gnome"
japanese="fcitx5-im fcitx5-mozc"
gaming="gamemode wine-mono wine-gecko wine-staging lutris"
winedep="giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader"
AUR="qt5ct-kde intel-hybrid-codec-driver brave-bin discord_arch_electron xp-pen-tablet protonup-qt mangohud lib32-mangohud goverlay an-anime-game-launcher-bin whatsapp-nativefier heroic-games-launcher-bin spotify polymc modprobed-db pcsx2-git citra-qt-git"

sudo pacman -S --needed $x11 $audio $graphics $fonts $wm $file $apps $polkit $japanese $gaming $winedep
yay -S $AUR --sudoloop

#dotfiles
mkdir ~/.config
mkdir ~/.config/bspwm
mkdir ~/.config/polybar
mkdir ~/.config/sxhkd
cd repo/dotfiles
cp .xinitrc cp ~/.xinitrc
cp bspwm/bspwmrc ~/.config/bspwm/bspwmrc
cp bspwm/autostart ~/.config/bspwm/autostart
cp bspwm/bspwm_rule ~/.config/bspwm/bspwm_rule
cp bspwm/Floating_Desktop ~/.config/bspwm/Floating_Desktop
cp sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
cp polybar/config.ini ~/.config/polybar/config.ini

echo install complete

