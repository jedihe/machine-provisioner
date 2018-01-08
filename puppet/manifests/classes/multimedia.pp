class multimedia {
  $multimedia = [
    'audacious',
    'caps',
    'vlc',
    'smplayer',
    'gpac',
    'gimp',
    'mypaint',
    'audacity',
    'pavucontrol',
    'pavumeter',
  ]

  package { $multimedia:
    ensure => installed,
  }

  ppa_package { "sound device switcher":
    ppa => 'ppa:yktooo/ppa',
    package => 'indicator-sound-switcher',
  }

  # The ppa causes kernel updates to break. Remove after installing the eq.
  ppa_package { "pulseaudio-equalizer":
    ppa => 'ppa:nilarimogard/webupd8',
    package => 'pulseaudio-equalizer',
  }
}
