#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [[ -f $sysresources ]]; then
  xrdb -merge $sysresources
fi

if [[ -f $sysmodmap ]]; then
  xmodmap $sysmodmap
fi

if [[ -f "$userresources" ]]; then
  xrdb -merge "$userresources"
fi

if [[ -f "$usermodmap" ]]; then
  xmodmap "$usermodmap"
fi

# start some nice programs
# dunst (notification server)
dunst -conf ~/.config/dunst/dunstrc &
picom -b --experimental-backends &
xrdb -merge .Xresources
feh --bg-fill ~/.config/wallpapers/custom.png &
xrdb -merge  ~/.Xresources &
xrandr --output eDP-1 --mode 3840x2400 &
xrandr --output eDP-1 --gamma 1:0.95:1 &
numlockx on &
slstatus &
autorandr --change &
exec dbus-run-session -- dwm
