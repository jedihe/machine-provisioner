class virtualization {
  installers::dl_installer { "Virtualbox 5.1":
    url => "http://download.virtualbox.org/virtualbox/5.1.30/virtualbox-5.1_5.1.30-118389~Ubuntu~xenial_amd64.deb",
    filename => "virtualbox-5.1.30.deb",
  }

  installers::run_installer { "virtualbox-5.1.30":
    package_name => 'virtualbox-5.1',
    require => Installers::Dl_installer['Virtualbox 5.1'],
  }

  # Only download the extension pack.
  installers::dl_installer { "dl virtualbox extpack":
    url => "http://download.virtualbox.org/virtualbox/5.1.30/Oracle_VM_VirtualBox_Extension_Pack-5.1.30-118389.vbox-extpack",
    filename => 'virtualbox-5.1.30.vbox-extpack',
  }

  installers::dl_installer { "vagrant 1.9.0":
    url => "https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0_x86_64.deb",
    filename => "vagrant_1.9.0.deb",
  }

  installers::run_installer { "vagrant_1.9.0":
    package_name => 'vagrant',
    require => Installers::Dl_installer['vagrant 1.9.0'],
  }

  package { 'debootstrap': ensure => installed }
}
