class dev {
  package { 'lua5.2': ensure => installed }

  # ==================================================
  # Web Dev
  # ==================================================
  ppa_package { "node js":
    ppa => 'ppa:chris-lea/node.js',
    package => 'nodejs',
  }

  exec { 'grunt cli':
    command => 'npm install -g grunt-cli',
    unless => 'ls /usr/bin/grunt',
    path => ['/bin', '/usr/bin'],
    logoutput => true,
    require => Ppa_package['node js'],
  }
}
