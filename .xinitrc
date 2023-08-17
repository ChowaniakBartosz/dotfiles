#!/bin/bash

# Faster key repeat rate
xset r rate 200 50 &                      

# Polish keyboard layout + Caps<->Escape
setxkbmap pl -option caps:swapescape &    

# Hide mouse after 5 seconds of inactivity
unclutter --timeout 5 &                   

# Set wallpaper
setwp &

# Simple X Hotkey Daemon
sxhkd &                              

# DWM Status Bar
dwmblocks &       

# Compositor
# picom &

# Music Player Daemon
# mpd &

# Notification agent
dunst &

# DWM
exec dwm                                  
