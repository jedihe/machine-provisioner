class indicators {
  $indicators = [
    'indicator-multiload',
    'indicator-cpufreq',
  ]

  package { $indicators:
    ensure => present,
  }

  package { "caffeine":
    ensure => installed
  }

  package { "redshift-gtk":
    ensure => installed,
  }
}
