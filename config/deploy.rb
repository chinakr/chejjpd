# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'chejjpd'
# set :repo_url, 'git@github.com:chinakr/chejjpd.git'
set :repo_url, 'https://github.com/chinakr/chejjpd.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :deploy_to, '/home/deploy/pd.chejj.com.cn/chejjpd'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'shared/log', 'shared/pids', 'shared/sockets', 'tmp/cache', 'tmp/pids', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :puma_state, "#{shared_path}/shared/pids/puma.state"
set :puma_pid, "#{shared_path}/shared/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/shared/sockets/puma.sock"
set :puma_default_control_app, "unix://#{shared_path}/shared/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_threads, [5, 5]
set :puma_workers, 2
set :puma_jungle_conf, '/etc/puma.conf'

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
