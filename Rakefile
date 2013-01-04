require 'bundler'
Bundler.setup

require 'rake'
require 'rspec/core/rake_task'

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

task :gem => :build
task :build do
  system 'gem build russianpost.gemspec'
end

task :install => :build do
  require 'russianpost/version'
  system "sudo gem install russianpost-#{RussianPost::VERSION}.gem"
end

task :clean do
  system 'rm -rf ./coverage/*'
  system 'rmdir ./coverage'
  system 'rm *.gem'
end

task :release => :build do
  require 'russianpost/version'
  system "git tag -a v#{RussianPost::VERSION} -m 'Tagging #{RussianPost::VERSION}'"
  system "git push --tags"
  system "gem push russianpost-#{RussianPost::VERSION}.gem"
  system "rm russianpost-#{RussianPost::VERSION}.gem"
end

RSpec::Core::RakeTask.new('spec') do |spec|
  spec.rspec_opts = %w(--format d --color --profile)
  spec.pattern = 'spec/**/*_spec.rb'
end