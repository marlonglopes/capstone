require 'capistrano/ext/multistage'

set :application, "capstone"
set :repository,  "https://github.com/marlonglopes/capstone.git"
set :branch, "master"
set :deploy_via, :remote_cache                        # fetches from local git repo on the server rather then clone repo on each deploy

set :stages, ["dev"]
set :default_stage, "dev"

set :deploy_to, "/app/#{application}"

set :scm, :git
set :user, "ubuntu"
set :keep_releases, 3
set :use_sudo, true

set :ssh_options, {:forward_agent => true, :verify_host_key => :never, keys: ['~/.ssh/marlon.pem', '~/.ssh/id_rsa']}
set :default_run_options, {:pty => true}

before :deploy, :ensure_user

task :ensure_user do
    run "sudo chown ubuntu:ubuntu /app -R"
end

