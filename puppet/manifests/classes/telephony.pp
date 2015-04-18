class telephony {
  ppa_package { "install skype":
    ppa => '"deb http://archive.canonical.com/ubuntu trusty partner"',
    package => 'skype',
  }

  $dependencies = [
    'libqt4-gui',
    'libid3-3.8.3c2a',
  ]
  package { $dependencies:
    ensure => installed
  }

  installers::dl_installer { "skype call recorder":
    url => "http://atdot.ch/scr/files/0.10/skype-call-recorder-ubuntu_0.10_amd64.deb",
    filename => "skype-call-recorder-0.10.amd64.deb",
    require => Package['libqt4-gui', 'libid3-3.8.3c2a'],
  }

  installers::run_installer { "skype-call-recorder-0.10.amd64":
    package_name => 'skype-call-recorder',
    require => Installers::Dl_installer['skype call recorder'],
  }
}
