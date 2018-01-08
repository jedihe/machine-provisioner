class nvidia {
  ppa_package { "nvidia 375":
    ppa => 'ppa:graphics-drivers/ppa',
    package => 'nvidia-375',
  }
}
