# config valid for current version and patch releases of Capistrano
lock "~> 3.19.1"

set :application, "app1"  # Your application name
set :repo_url, "https://github.com/p-guelfi/app1.git"  # Your GitHub repository URL

# Deploy to the specified directory
set :deploy_to, "/home/deploy/#{fetch :application}"

# Specify linked directories to be shared between releases
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Keep the last 5 releases to save disk space
set :keep_releases, 5

set :default_env, {
  'CLOUDINARY_URL' => 'cloudinary://866611883174648:1IncUX5YSql50IXg0qEU1oXzDIQ@dtbqxujlt',
  'DATABASE_URL' => 'postgresql://deploy:pg123456@127.0.0.1/app1',
  'RAILS_MASTER_KEY' => '6caabca372119776e0847f3430b2424f',
  'SECRET_KEY_BASE' => '49b4669de6edc62aef682a43cfb0239be98e03dd2bbeb3c8ee62de007b91cb6db071a522ba6d90502c797a9f34a53da3327b99e43832b59fe17bb28021aa4c77'
}

append :linked_files, 'config/master.key'



# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
