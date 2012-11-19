node "default" {
  include apache2
  include mysql
  include ios_backend
  include passenger
}