class unity_settings {
  #gsettings::set { "ShiftAlt HUD":
    #path => 'org.compiz.integrated',
    #key => 'show-hud',
    #value => "\"['<Shift><Alt>']\"",
  #}

  #gsettings::set { "Enable Faenza Iconset":
    #path => 'org.gnome.desktop.interface',
    #key => 'icon-theme',
    #value => '"Faenza-Ambiance"',
    #require => Package['faenza-icon-theme'],
  #}
}
