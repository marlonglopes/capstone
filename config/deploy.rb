require 'capistrano/ext/multistage'

set :application, "capstone"
set :repository,  "https://github.com/marlonglopes/capstone.git"
set :branch, "master"
set :deploy_via, :remote_cache                        # fetches from local git repo on the server rather then clone repo on each deploy

set :stages, ["dev"]
set :default_stage, "dev"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "54.186.15.76"                          # Your HTTP server, Apache/etc
role :app, "54.186.15.76"                          # This may be the same as your `Web` server

set :deploy_to, 'app'
set :scm, :git
set :user, "ubuntu"
set :keep_releases, 3
set :use_sudo, false

set :ssh_options, {:forward_agent => true, :verify_host_key => :never, keys: ['~/.ssh/marlon.pem']}
set :default_run_options, {:pty => true}
# set :copy_via, :scp
# ssh_options[:keys] = %w(~/.ssh/marlon.pem)
# ssh_options[:forward_agent] = true
# default_run_options[:pty] = true

# set :deploy_via, :remote_cache


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

# after "deploy:setup", "deploy:create_release_dir"
# namespace :deploy do
#   task :create_release_dir, :except => {:no_release => true} do
#     run "mkdir -p #{fetch :releases_path}"
#   end
# end