export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
export QT_IM_MODULES="wayland;fcitx"
export GLFW_IM_MODULE=ibus
export SUDO_EDITOR=nvim

nmcli radio wifi on
rfkill unblock wifi
rfkill unblock bluetooth

