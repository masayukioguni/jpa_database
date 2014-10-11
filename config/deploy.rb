require 'rvm1/capistrano3'

lock '3.2.1'

set :application, 'JPADatabase'
set :repo_url, 'https://github.com/masayukioguni/jpa_database.git'
set :deploy_to, "/home/deploy/staging"
set :keep_releases, 5

set :config_backend, :dotenv # currently this is the only supported backend
set :config_file,    "#{shared_path}/.env"  # you might want to use .env.production instead

set :rvm_type, :system
set :rvm1_ruby_version, '2.1.3'

set :format, :pretty
set :log_level, :debug # :info or :debug

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w(bin log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle)
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

before 'deploy', 'rvm1:install:rvm'  # install/update RVM
before 'deploy', 'rvm1:install:ruby'  # install/update Ruby

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Upload database.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/database.yml', "#{shared_path}/config/database.yml")
    end
  end

end

