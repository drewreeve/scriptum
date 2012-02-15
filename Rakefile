require './init'

task :default => :test

require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

desc "Load app into IRB."
task :console do
  exec "irb -I. -rinit"
end