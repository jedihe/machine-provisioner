class zsh {
  package { 'zsh': ensure => installed }

  exec { "oh-my-zsh":
    command => "git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh &&
    chown -R ${username}:${username} .oh-my-zsh &&
    chsh -s /bin/zsh $::username",
    creates => "$::userdir/.oh-my-zsh",
    logoutput => true,
    cwd => $::userdir,
    path => ['/bin/', '/usr/bin/'],
    require => [Class['git'], Package['zsh']],
  }

  file { 'zshrc':
    ensure => present,
    source => "puppet:///modules/miscfiles/.zshrc",
    path => "$::userdir/.zshrc",
    mode   => 664,
    owner => $::username,
    group => $::username,
    replace => true,
    require => Exec['oh-my-zsh'],
  }
}
