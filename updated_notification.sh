#!/bin/bash
#notify-send 'System Updated' 'Archlinux has been updated successfully. Dont forget update AUR packeges ' --icon=dialog-information
sudo -u abner DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send 'System Updated' 'Archlinux has been updated successfully.\n Dont forget update AUR packeges'
