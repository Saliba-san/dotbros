#!/bin/sh
redshift-gtk &
compton &
~/.fehbg &
setxkbmap -option caps:swapescape
(sleep 5 ; dwmblocks) &

exec dwm
