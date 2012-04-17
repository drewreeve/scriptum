require './init'

task :default => :spec

begin
  require 'rspec/core/rake_task'

  desc "Run specs"
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = './spec/**/*_spec.rb'
  end
rescue LoadError
end

desc "Load app into IRB."
task :console do
  exec "irb -I. -rinit"
end

namespace :users do
  desc "Create New User"
  task :add do

    begin
      print "Username: "
      username = STDIN.gets.chomp

      system "stty -echo"
      print "Password (at least 6 chars): "
      password = STDIN.gets.chomp
      print "\nConfirm password: "
      password_confirmation = STDIN.gets.chomp
      system "stty echo"

      unless password == password_confirmation
        print "\n\nPasswords did not match, exiting..."
        exit
      end

      u = User.new(:username => username, :password => password)

      if u.save
        print "\n User #{u.username} created successfully \n"
      else
        print "\n There was a problem creating the user: \n"
        u.errors.each do |attr, msg|
          print "- #{attr.to_s.capitalize} #{msg} \n"
        end
      end
    rescue NoMethodError, Interrupt
      system "stty echo"
      exit
    end
  end
end

namespace :db do
  task :create_indexes do
    Post.ensure_index [[:slug, 1]], :unique => true
  end
end
