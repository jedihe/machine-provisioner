class indicators {
  $indicators = [
    'indicator-multiload',
    'indicator-cpufreq',
  ]

  package { $indicators:
    ensure => present,
  }

  # Caffeine 2.7 has no GUI :(
  #ppa_package { "caffeine indicator":
    #ppa => 'ppa:caffeine-developers/ppa',
    #package => 'caffeine',
  #}

  # Install Caffeine 2.5
  $caffeine_deps = [
    'gir1.2-gtk-2.0',
    'libsqlite0',
    'python-kaa-base',
    'python-kaa-metadata',
    'python-sqlite',
  ]

  package { $caffeine_deps:
    ensure => installed,
  }

  installers::dl_installer { 'caffeine 2.5':
    url => 'https://launchpad.net/~caffeine-developers/+archive/ppa/+files/caffeine_2.5_all.deb',
    filename => 'caffeine_2.5.deb',
  }

  installers::run_installer { "caffeine_2.5":
    package_name => 'caffeine',
    require => [
      Installers::Dl_installer['caffeine 2.5'],
      Package[$caffeine_deps],
    ],
  }

  package { "redshift-gtk":
    ensure => installed,
  }
}
