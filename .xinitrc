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







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
  --output DP-0 --mode 1366x768 --pos 1920x312 --rotate normal --output DP-1 --off \
  --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off

# Without this the mouse does not appear until an program is launched
xsetroot -cursor_name left_ptr

pa-applet &

nitrogen --restore &

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 5 --transparent true --tint 0x2f2f2f --alpha 0 --height 20 --iconspacing 6 &

picom &

dunst &

exec xmonad
