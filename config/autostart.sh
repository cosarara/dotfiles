#!/bin/sh

# Configure PATH so that we can access our scripts below
#PATH=$PATH:~/.cabal/bin:~/.xmonad/bin

# Configure X
#xsetroot -cursor_name left_ptr &
#xrdb -merge ~/.Xdefaults &

# Start a window compositor. This ensures Google Chrome paints correctly.
#xcompmgr -n &
#if [[ "$DISPLAY" == ":0" ]]; then
#	killall compton || true
#	compton --config ~/.config/compton &
#fi
#nitrogen --restore &
#feh --randomize --bg-fill --no-xinerama ~/Pictures/wallpaper
#randwallpaper

#trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 4 --transparent true --alpha 17 --tint 0x34322E --height 16 --distance 4 --margin 160

#{
#	sleep 3
#	killall picom || true
#	picom --config ~/.config/picom
#} &

#pgrep redshift &> /dev/null || redshift &> /dev/null &

~/.config/autostart_once.sh

# Start the system tray
#tray &

# Start two terminals
#gnome-terminal &
#gnome-terminal &
#
## Start a browser
#google-chrome &

# Start screensaver
# Kill gnome-screensaver if started by default
#killall gnome-screensaver &
#xscreensaver -no-splash &

# Start sound server
#pulseaudio --start &

#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad

wait
