class network {
  $network_packages = [
    'network-manager-openvpn',
    'network-manager-openvpn-gnome',
    'youtube-dl',
  ]

  package { $network_packages: ensure => installed }
}
