require 'capistrano/ext/multistage'

set :application, "capstone"
set :repository,  "git@github.com:marlonglopes/capstone.git"

set :stages, ["dev"]
set :default_stage, "dev"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "18.236.85.237"                          # Your HTTP server, Apache/etc
role :app, "18.236.85.237"                          # This may be the same as your `Web` server


set :deploy_to, 'src'
set :scm, :git
set :user, "ubuntu"
ssh_options[:keys] = %w(~/.ssh/marlon.pem)
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end