class xsettings {
  file { "marblemouse config":
    ensure => present,
    source => "puppet:///modules/miscfiles/50-marblemouse.conf",
    path => "/usr/share/X11/xorg.conf.d/50-marblemouse.conf",
    mode => 644,
    owner => "root",
    group => "root",
    replace => true,
  }
}
