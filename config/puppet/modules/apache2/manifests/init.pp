class apache2 {
  package {
    "apache2":
      ensure => present,
      before => File["/etc/apache2/apache2.conf"]
  }
  service {
    "apache2":
      ensure => true,
      enable => true,
      subscribe => File["/etc/apache2/apache2.conf"]
  }
  file {
    "/etc/apache2/apache2.conf":
      source => "puppet:///modules/apache2/apache2.conf",
      mode   => 644,
      owner  => root,
      group  => root;
    "/etc/apache2/sites-enabled/ios_backend.conf":
      source => "puppet:///modules/apache2/ios_backend.conf",
      mode   => 644,
      owner  => root,
      group  => root,  
      notify  => Service["apache2"],
      require => Package["apache2"];
  } 
  file { 
    "/etc/apache2/sites-enabled/000-default": 
      ensure => absent 
  }
  
}