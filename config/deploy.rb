# config valid only for Capistrano 3.1
lock '~>3.11'

config = YAML.load_file('config/deploy-config.yml') || {}

set :application, 'ack4nagios'
set :repo_url, config['repo_url']
set :relative_url_root, config['relative_url_root'] || '/'
set :ruby_path, ( config['ruby_path'].nil? ) ?  "$PATH" : config['ruby_path'] + ":$PATH"
set :passenger_restart_with_touch, true

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
ask :branch, :master

# Default deploy_to directory is /var/www/my_app
set :deploy_to, config['deploy_to']

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, false

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/application.yml config/GenericTicketConnector.wsdl config/secrets.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_dirs, %w{bin log files tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, { 
  rails_relative_url_root: fetch(:relative_url_root),
  path: fetch(:ruby_path)}

set :shell, "bash -l"

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc "Check that we can access everything"
  task :check_write_permissions do
    on roles(:all) do |host|
      if test("[ -w #{fetch(:deploy_to)} ]")
        info "#{fetch(:deploy_to)} is writable on #{host}"
      else
        error "#{fetch(:deploy_to)} is not writable on #{host}"
      end
    end
  end

  desc "printenv"
  task :printenv do
    on roles(:all) do |host|
      execute "printenv"
    end
  end
end
