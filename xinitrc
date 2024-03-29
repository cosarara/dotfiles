#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge -I$HOME "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/coses/monitor.sh ]] && ~/coses/monitor.sh

#export QT_QPA_PLATFORMTHEME="qt5ct"
QT_STYLE_OVERRIDE=breeze
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

#setxkbmap -layout us,es -variant norman, grp:caps_toggle
#setxkbmap -layout jaume,us -option grp:caps_toggle -option compose:menu
#setxkbmap -layout jaume,us -option grp:rctrl_rshift_toggle -option compose:menu

dbus-update-activation-environment --systemd --all
eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

#[[ $POLKIT != "no" ]] && lxpolkit &
[[ $POLKIT != "no" ]] && /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

#pactl upload-sample /usr/share/sounds/freedesktop/stereo/bell.oga x11-bell && \
#pactl load-module module-x11-bell sample=x11-bell display=$DISPLAY &

xset +fp $HOME/.local/share/fonts/

xsetroot -cursor_name left_ptr

#randwallpaper

default_session=awesome
#default_session=openbox

session=${WM:-$default_session}
session=${1:-$session}

#if [[ $(hostname) == "evangelion" ]]; then
#	default_session=bspwm
#fi

# lol wat is dis
if [ "$1" = "xterm" ]; then
	session=${2:-$default_session}
fi

case $session in
    awesome           ) exec awesome;;
    bspwm             ) exec ~/.config/bspwm/wm;;
    catwm             ) exec catwm;;
    cinnamon          ) exec cinnamon-session;;
    dwm               ) exec dwm;;
    enlightenment     ) exec enlightenment_start;;
    ede               ) exec startede;;
    fluxbox           ) exec startfluxbox;;
    gnome             ) exec gnome-session;;
    gnome-classic     ) exec gnome-session --session=gnome-classic;;
    i3|i3wm           ) exec i3;;
    icewm             ) exec icewm-session;;
    jwm               ) exec jwm;;
    kde               ) exec startkde;;
    mate              ) exec mate-session;;
    monster|monsterwm ) exec monsterwm;;
    notion            ) exec notion;;
    openbox           ) exec openbox-session;;
#    openbox           ) exec openbox --replace;;
    unity             ) exec unity;;
    xfce|xfce4        ) exec startxfce4;;
    xmonad            ) exec xmonad;;
    fvwm              ) exec fvwm-themes-start;;
    herb              ) exec herbstluftwm --locked;;
    # No known session, try to run it as command
    *) exec $1;;
    #*) echo $session not known >> log;;
esac
