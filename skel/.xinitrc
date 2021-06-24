# Apply Adapta GTK theme
export GTK_THEME="Adapta:dark"

# Apply wallpaper
feh --no-fehbg --bg-scale '/usr/share/backgrounds/adapta/tealized.jpg' 

# Ensures that $HOME is the working directory
cd

# Start conky for dwm status bar
conky | dwm-setstatus &

# Start xbanish to hide mouse cursor when typing
xbanish &

# Start dwm (Dynamic Window Manager)
exec dwm
