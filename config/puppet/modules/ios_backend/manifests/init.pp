class ios_backend {
  file {
    ["/var/app",
    "/var/app/ios_backend/",
    "/var/app/ios_backend/shared/",
    "/var/app/ios_backend/shared/config/"]:
    ensure => directory,
    owner  => ubuntu,
    group  => ubuntu,
    mode   => 775
  } 

  package {
    "bundler":
      provider => gem
  }
}