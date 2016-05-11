#!/bin/sh

echo $@ $WM

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#source /etc/X11/xinit/xserverrc

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

#setxkbmap -layout us,es -variant norman, grp:caps_toggle
setxkbmap -layout jaume,us -option grp:caps_toggle -option compose:menu

eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

[[ $POLKIT != "no" ]] && lxpolkit &

if [ -z ${WM+x} ]; then
	WM=$1
fi

xset +fp $HOME/.local/share/fonts/

xsetroot -cursor_name left_ptr
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

randwallpaper

case $WM in
    gnome) exec gnome-session;;
    kde) exec startkde;;
    xfce) exec startxfce4;;
    openbox) exec openbox-session;;
    i3) exec i3;;
    #bspwm) sxhkd & exec bspwm;;
    bspwm) exec .config/bspwm/wm;;
    xmonad) exec xmonad;;
    awesome) exec awesome;;
    mwm) exec mwm;;
    fvwm) exec fvwm-themes-start;;
    *) exec .config/bspwm/wm;;
esac
