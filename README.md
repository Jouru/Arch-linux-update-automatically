# Linux-Auto-update

System_update is a service which update linux automatically twice a month using systemd timer. This script by default update Archlinux system, but can update other linux system that use systemd as init system modifyng the update command in the update script.

## Dependencies

- [D-Bus](https://wiki.archlinux.org/title/D-Bus)
- [notification-daemon](https://archlinux.org/packages/extra/x86_64/notification-daemon/)

## Usage
- Install notification-daemon and D-bus in case you don't have it already
- After install the notification-daemon package, add the following configuration to D-Bus services directory (/usr/share/dbus-1/services or $XDG_DATA_HOME/dbus-1/services)

      org.freedesktop.Notifications.service
      [D-BUS Service]
      Name=org.freedesktop.Notifications
      Exec=/usr/lib/notification-daemon-1.0/notification-daemon
- Make system-update.sh executable

      chmod +x system-update.sh
  
- Change the owner of the files to root running the following commands

      chown root:root system-update.sh
      chown root:root system_update.service
      chown root:root system_update.timer
  
- Move the system-update.sh file into ~/.scripts/ folder (Create it if you don't have already)
- Move the system_update.service and system_update.timer files into "/etc/systemd/system" folder
- reload all the daemons

      sudo systemctl daemon-reload

- start the timer

      sudo systemctl start system_update.timer

- Enable the timer

      sudo systemctl enable system_update.timer

## Modify to work with diferent linux distros
This service work by default in archlinux, in order to make it work with another distro we need to edit the update command in the system-update.sh file.
The command:

      pacman -Syu --noconfirm

must be replaced by the update command of your linux distro. Be sure the command must be in non confirm way, in other words, the command must avoid the confirmation prompt.

### In debian based distros
In debian based distros (like Ubuntu, pop os, linux mint, etc) one of this commands must work as substitute of the update command:

    apt-get update && apt-get upgrade -y

    apt-get update && apt-get upgrade --assume-yes

alternatively you can set the environment variable DEBIAN_FRONTEND to noninteractive in order of avoid the confirmation prompt as fallows:

    export DEBIAN_FRONTEND=noninteractive

### Other linux distros
Consult the documentation of your linux distro in order to avoid the confirmation prompt in the upgrade command.
