class network {
  $network_packages = [
    'network-manager-openvpn',
    'network-manager-openvpn-gnome',
    'youtube-dl',
  ]

  package { $network_packages: ensure => installed }

  ppa_package { "btsync":
    ppa => 'ppa:tuxpoldo/btsync',
    package => 'btsync-gui',
  }

  ppa_package { "jdownloader":
    ppa => 'ppa:jd-team/jdownloader',
    package => 'jdownloader',
  }
}
