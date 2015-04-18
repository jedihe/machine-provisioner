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

  ppa_package { "ffmpeg":
    ppa => 'ppa:mc3man/trusty-media',
    package => 'ffmpeg',
  }

  ppa_package { "pulseaudio-equalizer":
    ppa => 'ppa:nilarimogard/webupd8',
    package => 'pulseaudio-equalizer',
  }
}
