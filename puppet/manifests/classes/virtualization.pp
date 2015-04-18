class virtualization {
  ppa_package { "virtualbox 4.3":
    ppa => 'multiverse',
    package => 'virtualbox',
  }

  installers::dl_installer { "dl virtualbox extpack":
    url => "http://download.virtualbox.org/virtualbox/4.3.10/Oracle_VM_VirtualBox_Extension_Pack-4.3.10-93012.vbox-extpack",
    filename => 'virtualbox-4.3.10-93012.vbox-extpack',
  }

  installers::dl_installer { "vagrant 1.6.3":
    url => "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb",
    filename => "vagrant_1.6.3.deb",
  }

  installers::run_installer { "vagrant_1.6.3":
    package_name => 'vagrant',
    require => Installers::Dl_installer['vagrant 1.6.3'],
  }

  package { 'debootstrap': ensure => installed }
}
