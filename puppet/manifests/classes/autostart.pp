class autostart {
  file { "startup.sh":
    ensure => present,
    source => "puppet:///modules/miscfiles/startup.sh",
    path => "$::userdir/startup.sh",
    mode => 754,
    owner => $::username,
    group => $::username,
    replace => true,
  }

  file { "autorun startup.sh":
    ensure => present,
    content => template('miscfiles/startup.sh.desktop.erb'),
    path => "$::userdir/.config/autostart/startup.sh.desktop",
    mode => 644,
    owner => $::username,
    group => $::username,
    replace => true,
    require => File['startup.sh'],
  }

  package { 'python-tk':
    ensure => 'installed',
  }

  exec { 'clone workday repo':
    command => 'git clone http://github.com/jedihe/workday.git workday',
    cwd => "$::userdir/src",
    unless => "ls $::userdir/src/workday/workday.py",
    user =>  $::username,
    group => $::username,
    path => ['/bin', '/usr/bin'],
    require => Package['python-tk'],
  }

  file { "autorun workday.py":
    ensure => present,
    content => template('miscfiles/workday.py.desktop.erb'),
    path => "$::userdir/.config/autostart/workday.py.desktop",
    mode => 644,
    owner => $::username,
    group => $::username,
    replace => true,
    require => Exec['clone workday repo'],
  }
}
