set :application, "DesertOperations"
set :repository,  "ssh://root@176.31.112.87/~/DesertOperations.py"
set :domain, "localhost"
set :applicationdir, "~/DesertOperations"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`



set :deploy_to, applicationdir
set :deploy_via, :export
default_run_options[:pty] = true 
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