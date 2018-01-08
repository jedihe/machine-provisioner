class hibernation {
# file { "hibernate polkit":
#   ensure => present,
#   source => "puppet:///modules/miscfiles/com.ubuntu.enable-hibernate.pkla",
#   path => "/var/lib/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla",
#   mode => 644,
#   owner => "root",
#   group => "root",
#   replace => true,
# }
}
