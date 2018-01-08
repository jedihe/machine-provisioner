#!/bin/bash

gsettings set org.gnome.desktop.interface icon-theme "Faenza-Ambiance"
gsettings set org.compiz.integrated show-hud "['<Shift><Alt>']"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "<Super>"

# Show username on session indicator
gsettings set com.canonical.indicator.session show-real-name-on-panel "true"

# Multiload indicator
gsettings set de.mh21.indicator-multiload.general autostart "true"
gsettings set de.mh21.indicator-multiload.general graphs "['load','cpu','mem','disk','swap','net']"
gsettings set de.mh21.indicator-multiload.general width "30"
gsettings set de.mh21.indicator-multiload.graphs.cpu enabled "true"
gsettings set de.mh21.indicator-multiload.graphs.disk enabled "true"
gsettings set de.mh21.indicator-multiload.graphs.load enabled "true"
gsettings set de.mh21.indicator-multiload.graphs.net enabled "true"
gsettings set de.mh21.indicator-multiload.graphs.swap enabled "true"

# Calendar indicator
gsettings set com.canonical.indicator.datetime show-locations "true"
gsettings set com.canonical.indicator.datetime show-date "true"
gsettings set com.canonical.indicator.datetime show-day "true"
gsettings set com.canonical.indicator.datetime locations "['America/New_York NYC']"

# Expo size
#gsettings set org.compiz.profiles.unity.plugins.core hsize "2"
#gsettings set org.compiz.profiles.unity.plugins.core vsize "2"

# First run of certain apps
#ps aux | grep [f]luxgui > /dev/null || fluxgui &
ps aux | grep [c]affeine > /dev/null | caffeine &

# Enable pepperflashplugin-nonfree
#sudo update-pepperflashplugin-nonfree --install

# Configure gnome-termiinal
gconftool-2 --set /apps/gnome-terminal/profiles/Default/use_system_font --type bool false
gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Monospace 10"

# Deja-Dup settings (Backup)
gsettings set org.gnome.DejaDup exclude-list '["$TRASH", "$DOWNLOAD"]'
gsettings set org.gnome.DejaDup include-list "['$HOME/Documents', '$HOME/config', '$HOME/Dropbox', '$HOME/Music', '$HOME/Pictures', '$HOME/work']"
gsettings set org.gnome.DejaDup full-backup-period 90
gsettings set org.gnome.DejaDup periodic "true"
gsettings set org.gnome.DejaDup periodic-period 1
