require './init'

task :default => :console

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
      system "stty echo"

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