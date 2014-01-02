GNU nano 2.2.6                                                        File: deploy.rb

require "bundler/capistrano"
require "rvm/capistrano"
#
set :rvm_ruby_string, "ruby-2.0.0-p247"
set :rvm_type, :system
set :application, "Food Mesh"
set :repository,  "git@git.mediacube.at:fhs34784/food-mesh.git"
set :scm, :git
set :user, "deploy_eight"
set :branch, "master"
#
set :use_sudo, false
#
set :deploy_to, "/var/www/virthosts/eight"
#
role :web, "rails.multimediatechnology.at:5412"                          # Your HTTP server, Apache/etc
role :app, "rails.multimediatechnology.at:5412"                          # This may be the same as your `Web` server
role :db,  "rails.multimediatechnology.at:5412", :primary => true # This is where Rails migrations will run
#
# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => assets_role, :except => { :no_release => true } do
      run <<-CMD.compact
        cd -- #{latest_release.shellescape} &&
        #{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env} assets:precompile
      CMD
    end
  end
end
