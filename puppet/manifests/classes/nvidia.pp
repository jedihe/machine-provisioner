class nvidia {
  ppa_package { "nvidia 340":
    ppa => 'ppa:xorg-edgers/ppa',
    package => 'nvidia-340',
  }
}
