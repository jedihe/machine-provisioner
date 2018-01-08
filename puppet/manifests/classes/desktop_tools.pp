class desktop_tools {
  $packages = [
    'shutter',
    'compizconfig-settings-manager',
    'nautilus-actions',
    'compiz-plugins-extra',
    'filezilla',
    'hexchat',
  ]

  package { $packages: ensure => installed }

  ppa_package { "double commander":
    ppa => 'ppa:alexx2000/doublecmd',
    package => 'doublecmd-gtk',
  }
}
