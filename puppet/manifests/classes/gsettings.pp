#define gsettings::set (
  #$path,
  #$key,
  #$value
#) {

  #exec { "GSettings set $name":
    #command => "gsettings set $path $key $value",
    #user => "$username",
    #path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games',
    #environment => ["HOME=/home/jedihe", "USER=jedihe", "DESKTOP_SESSION=ubuntu", "MANDATORY_PATH=/usr/share/gconf/ubuntu.mandatory.path", "COMPIZ_CONFIG_PROFILE=ubuntu", "GDMSESSION=ubuntu", "SESSIONTYPE=gnome-session", "INSTANCE=Unity", "XDG_DATA_DIRS=/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/", "XDG_CURRENT_DESKTOP=Unity", "XDG_VTNR=7", "XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/usr/share/upstart/xdg:/etc/xdg", "DISPLAY=:0"],
  #}
#}
