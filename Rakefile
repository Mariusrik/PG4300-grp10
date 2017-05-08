# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'This rebuilds development db'
namespace :books_database do
  Rake::Task["db:create"].invoke
  Rake::Task["db:schema:load"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
end