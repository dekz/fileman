require 'bundler/setup'

require 'rake'
require 'rspec/core/rake_task'
require "bundler/gem_tasks"
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end
