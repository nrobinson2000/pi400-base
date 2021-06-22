# Apply Adapta GTK theme
export GTK_THEME="Adapta:dark"

# Ensures that $HOME is the working directory
cd

# Start conky for dwm status bar
conky | dwm-setstatus &

# Start xbanish to hide mouse cursor when typing
xbanish &

# Start dwm (Dynamic Window Manager)
exec dwm
