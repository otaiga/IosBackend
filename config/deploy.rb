require 'bundler/capistrano'

set :application, "ios_backend"
set :repository,  "git@github.com:otaiga/IosBackend.git"

set :scm, :git
server "ec2-176-34-217-167.eu-west-1.compute.amazonaws.com", :web, :app, :db, :primary => true
ssh_options[:keys] = "~/.ssh/ios_backend.pem"  #(If an AWS etc)

set :deploy_to, "/var/app/ios_backend" 

set :user, "ubuntu"  #if using ubuntu user - aws
set :group, "ubuntu" #if using ubuntu user - aws
set :use_sudo, false  # not using sudo - no need

#The below allows copy (no need for ssh keys, etc on the remote server)
set :deploy_via, :copy
set :copy_strategy, :export


# if you want to clean up old releases on each deploy do this:
after "deploy:restart", "deploy:cleanup"


# If you are using Passenger mod_rails do this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

##This is for puppet deployments
namespace :puppet do
  task :bootstrap do
    system "config/puppet/bootstrap/bootstrap.sh"  #bootstrap sets up a vanilla server.
  end

  task :apply do
    run "sudo puppet apply /etc/puppet/manifests/site.pp"
  end
end