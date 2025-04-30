#
# ~/.bash_profile
#

if [ "$(tty)" = "/dev/tty1" ]; then
    if uwsm check may-start; then
	exec uwsm start hyprland.desktop
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
