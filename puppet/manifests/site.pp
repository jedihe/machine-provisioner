$username = 'jedihe'
$userdir = "/home/$::username"

# Fixed to download installers only once
$installersdirtree = ["/home/common", "/home/common/installers"]
$installersdir = "/home/common/installers"

import "classes/*"

node default {
  include apt
  include curl
  include installers

  include autostart
  include browsers
  include desktop_tools
  include dev
  include git
  include hibernation
  include indicators
  include multimedia
  include network
  include nvidia
  include oracle_java
  include ssr
  include sys
  include telephony
  include theme
  include unity_settings
  include vim
  include virtualization
  include xsettings
  include zsh
}

#notice("Username: ${user}")
