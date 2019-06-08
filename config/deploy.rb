require 'capistrano/ext/multistage'

set :application, "capstone"
set :repository,  "https://github.com/marlonglopes/capstone.git"
set :branch, "master"
set :deploy_via, :remote_cache                        # fetches from local git repo on the server rather then clone repo on each deploy

set :stages, ["dev"]
set :default_stage, "dev"

role :web, "54.186.15.76"                          # Your HTTP server, Apache/etc
role :app, "54.186.15.76"                          # This may be the same as your `Web` server

set :deploy_to, "app/#{application}"
set :scm, :git
set :user, "ubuntu"
set :keep_releases, 3
set :use_sudo, false

set :ssh_options, {:forward_agent => true, :verify_host_key => :never, keys: ['~/.ssh/marlon.pem']}
set :default_run_options, {:pty => true}

