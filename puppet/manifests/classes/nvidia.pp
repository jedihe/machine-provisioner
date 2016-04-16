class nvidia {
  ppa_package { "nvidia 352":
    ppa => 'ppa:graphics-drivers/ppa',
    package => 'nvidia-352',
  }
}
