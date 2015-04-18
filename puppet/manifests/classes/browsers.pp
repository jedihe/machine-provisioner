class browsers {
  package { "chromium-browser": ensure => 'installed' }
  package { 'adobe-flashplugin': ensure => installed }
  package { 'pepperflashplugin-nonfree': ensure => installed }

  ppa_package { "pepper flash":
    ppa => 'ppa:skunk/pepper-flash',
    package => 'pepflashplugin-installer',
  }

  $flash_confline = '". /usr/lib/pepflashplugin-installer/pepflashplayer.sh"'
  exec { 'enable pepper flash on Chromium':
    command => "echo $flash_confline >> /etc/chromium-browser/default",
    unless => 'grep "pepflashplugin" /etc/chromium-browser/default',
    require => Ppa_package['pepper flash'],
    path => ['/bin'],
  }
}
