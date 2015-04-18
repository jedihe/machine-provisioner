class desktop_tools {
  $packages = [
    'shutter',
    'compizconfig-settings-manager',
    'nautilus-open-terminal',
    'nautilus-actions',
    'compiz-plugins-extra',
    'nautilus-dropbox',
    'filezilla',
    'xchat',
  ]

  package { $packages: ensure => installed }
}
