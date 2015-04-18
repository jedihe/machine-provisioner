class oracle_java {
  apt::ppa { 'ppa:webupd8team/java': }

  exec { 'accept-java7-license':
    command => "echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections &&
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections",
    logoutput => true,
    timeout => 10,
    path => ['/bin/', '/usr/bin/'],
    unless => "debconf-get-selections | grep oracle-java7-installer",
    require => [Apt::Ppa['ppa:webupd8team/java']],
  }

  # This doesn't work because of an interactive license screen
  package { 'oracle-java7-installer':
    ensure => 'installed',
    require => [Class['Apt::Update'], Exec['accept-java7-license']],
  }
}
