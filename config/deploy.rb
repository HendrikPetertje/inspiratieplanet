require 'bundler/capistrano'
load 'deploy/assets'
 	
set :application, "inspiratieplanet"
set :ip_address, "149.210.131.191"
 
set :deploy_to, "/home/deploy/#{application}"
set :user, 'deploy'
set :use_sudo, false
 
set :scm, :git
set :repository, "git@github.com:amonfog/inspiratieplanet.git"
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }
 
default_run_options[:pty] = true
 
role :web, ip_address
role :app, ip_address
role :db,  ip_address, :primary => true

desc "tail log files"
task :tail, :roles => :app do
  run "tail -f #{shared_path}/log/#{rails_env}.log" do |channel, stream, data|
    puts "#{channel[:host]}: #{data}"
    break if stream == :err
  end
end

desc "populate database"
task :bootstrap do
	run("cd #{deploy_to}/current && /usr/bin/env rake bootstrap:all RAILS_ENV=production")
end
