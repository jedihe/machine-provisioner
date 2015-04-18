class sys {
  exec { "apt-update":
    command => 'apt-get update',
    refreshonly => true,
    path => "/usr/bin",
  }

  ppa_package { "ubuntu tweak":
    ppa => 'ppa:tualatrix/ppa',
    package => 'ubuntu-tweak',
  }

  ppa_package { "grub customizer":
    ppa => 'ppa:danielrichter2007/grub-customizer',
    package => 'grub-customizer',
  }

  $sys_pkgs = [
    'synaptic',
    'rsync',
    'dconf-editor',
    'ppa-purge',
    'gconf-editor',
    'gnome-system-tools',
    'gparted',
    'python-pip',
    'sysstat',
    'tmux',
    'xinput',
  ]
  package { $sys_pkgs:
    ensure => 'installed',
    require => Class['Apt::Update'],
  }

  exec { "fabric":
    command => 'pip install fabric',
    unless => 'pip list | grep Fabric',
    user => $::username,
    path => ['/bin', '/usr/bin'],
    require => Package['python-pip'],
  }


  file { 'tmux.conf':
    ensure => present,
    source => "puppet:///modules/miscfiles/.tmux.conf",
    path => "$::userdir/.tmux.conf",
    mode => 644,
    owner => $::username,
    group => $::username,
    replace => true,
    require => Package['tmux'],
  }
}
