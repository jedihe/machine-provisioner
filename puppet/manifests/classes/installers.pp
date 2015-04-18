class installers {
  file { $::installersdirtree:
    ensure  => directory,
    owner   => $::username,
    group   => $::username,
    mode    => 750,
  }
}

define installers::dl_installer (
  $url,
  $filename
) {


  exec { "dl installer {$name}":
    command => "wget -O $filename $url",
    unless => "ls ${::installersdir}/$filename",
    user => $::username,
    cwd => $::installersdir,
    path => ['/bin', '/usr/bin'],
    require => Class['installers'],
  }
}

define installers::run_installer (
  $package_name
) {
  exec { "run installer $name":
    command => "dpkg -i ${name}.deb",
    unless => "dpkg -l | grep -i $package_name",
    cwd => $::installersdir,
    path => ['/bin', '/usr/bin', '/usr/local/sbin', '/usr/sbin', '/sbin'],
    require => Class['installers'],
  }
}
