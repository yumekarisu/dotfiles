#! /bin/sh

kde="plasma-desktop kscreen packagekit-qt5 plasma-nm \
	powerdevil scim \
	kde-gtk-config plasma-workspace-wallpapers \
	kwallet kwallet-pam ksshaskpass \
	kgamma5 khotkeys kwrited plasma-pa \
	oxygen oxygen-sounds xdg-desktop-portal-kde"

wayland="plasma-wayland-session kwayland-integration xorg-xwayland"

audio="pipewire pipewire-pulse pipewire-alsa lib32-pipewire wireplumber"

graphics="mesa lib32-mesa xf86-video-amdgpu vulkan-intel \
	vulkan-radeon lib32-vulkan-intel lib32-vulkan-radeon libva-intel-driver"

fonts="ttf-dejavu ttf-liberation noto-fonts noto-fonts-extra \
	noto-fonts-cjk noto-fonts-emoji"

browser="firefox qbittorrent wget"

file="dolphin spectacle"

terminal="alacritty zsh zsh-completions neovim neofetch"

media="mpd mpv mupdf"

misc="breeze-icons \
	adwaita-qt5 adwaita-qt6 \
	redshift xdg-utils"

japanese="fcitx5-im fcitx5-mozc"

gaming="steam gamemode lib32-gamemode schedtool wine-stagging winetricks"

winedep="giflib lib32-giflib libpng lib32-libpng \
	libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils \
lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins \
alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite \
libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader \
libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs \
vulkan-icd-loader lib32-vulkan-icd-loader"

aur="discord_arch_electron \
	firefox-profile-switcher-connector-bin \
	yt-dlp schedtoold anki-official-binary-bundle \
	memento spotify \
	vimpc mpdris2 whatsapp-nativefier \
	an-anime-game-launcher-gtk-bin \
	networkmanager-iwd"

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd

pacman -Syu --needed $audio $graphics $fonts $kde $wayland $browser $file $terminal $media $misc $japanese $gaming $winedep

yay -S $aur --sudoloop

systemctl enable NetworkManager
systemctl enable schedtoold.service
