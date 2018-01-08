class desktop_tools {
  $packages = [
    'shutter',
    'compizconfig-settings-manager',
    'nautilus-actions',
    'compiz-plugins-extra',
    'filezilla',
    'xchat',
  ]

  package { $packages: ensure => installed }
}
