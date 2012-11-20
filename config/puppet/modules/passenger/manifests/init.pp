class passenger {
  exec {
    "/usr/bin/gem install passenger -v=3.0.11":
      user    => root,
      group   => root,
      alias   => "install_passenger",
      require => Package["apache2"],
      unless  => "ls /var/lib/gems/1.9.1/gems/passenger-3.0.11/"
  }

  exec {
    "/var/lib/gems/1.9.1/gems/passenger-3.0.11/bin/passenger-install-apache2-module --auto":
      user    => root,
      group   => root,
      path    => "/bin:/usr/bin:/usr/local/apache2/bin/",
      alias   => "passenger_apache_module",
      require => Package["apache2"],
      before => File["/etc/apache2/conf.d/passenger.conf"],
      unless  => "ls /var/lib/gems/1.9.1/gems/\
      passenger-3.0.11/ext/apache2/mod_passenger.so"
  }
  
  file {
    "/etc/apache2/conf.d/passenger.conf":
      mode    => 644,
      owner   => root,
      group   => root,
      alias   => "passenger_conf",
      require => Package["apache2"],
      notify  => Service["apache2"],
      source  => "puppet:///modules/passenger/passenger.conf"
  }
}