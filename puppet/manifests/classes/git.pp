class git {
  package { git:
    ensure => installed
  }

  file { 'gitconfig':
    ensure => 'file',
    source => "puppet:///modules/miscfiles/.gitconfig",
    path => "$::userdir/.gitconfig",
    mode   => 644,
    owner => $::username,
    group => $::username,
    replace => true,
    require => Package['git'],
  }
}
