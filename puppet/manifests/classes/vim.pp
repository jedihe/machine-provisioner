class vim {
  package { "vim": ensure => 'installed' }

  $vimdirs = ["$::userdir/.vim", "$::userdir/.vim/autoload", "$::userdir/.vim/bundle"]
  file { $vimdirs:
    ensure => "directory",
    mode => 644,
    owner => $::username,
    group => $::username,
    require => Package['vim'],
  }

  curl::fetch { "vim-pathogen":
    source => "https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim",
    destination => "$::userdir/.vim/autoload/pathogen.vim",
    timeout => 30,
    verbose => false,
    require => File["$::userdir/.vim/autoload"],
  }

  exec { "vim-plugins":
    command => "rm -rf $::userdir/.vim/bundle/* &&
git clone https://github.com/scrooloose/nerdtree.git &&
git clone https://github.com/kien/ctrlp.vim.git &&
git clone https://github.com/scrooloose/syntastic.git &&
git clone https://github.com/Lokaltog/vim-powerline.git &&
git clone https://github.com/ap/vim-css-color.git &&
git clone https://github.com/mattn/emmet-vim.git &&
git clone https://github.com/tpope/vim-surround.git &&
git clone https://github.com/godlygeek/tabular.git &&
git clone https://github.com/honza/vim-snippets.git &&
git clone https://github.com/joonty/vdebug.git &&
git clone https://github.com/majutsushi/tagbar.git &&
git clone https://github.com/joonty/vim-taggatron.git &&
chown -R ${username}:${username} $::userdir/.vim",
    logoutput => true,
    cwd => "$::userdir/.vim/bundle",
    timeout => 180,
    path => ['/bin/', '/usr/bin/'],
    unless => "ls $::userdir/.vimrc",
    require => [File["$::userdir/.vim/bundle"], Curl::Fetch['vim-pathogen'], Package['git']],
  }

  file { "vimrc":
    ensure => present,
    source => "puppet:///modules/miscfiles/.vimrc",
    path => "$::userdir/.vimrc",
    mode => 644,
    owner => $::username,
    group => $::username,
    replace => true,
    require => Exec['vim-plugins']
  }
}
