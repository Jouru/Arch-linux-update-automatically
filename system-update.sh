#! /usr/bin/zsh
pacman -Syu --noconfirm && sudo -u abner DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send 'System Updated' 'Archlinux has been updated successfully.\n Dont forget update AUR packeges'|| sudo -u abner DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send 'Update failed' 'Something goes wrong pacman cannot update the system. Execute "systemctl status system_update.service" for more informaion'

