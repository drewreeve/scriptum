require 'bundler/setup'
Bundler.require(:default)

Dir["./lib/*.rb"].sort.each {|req| require req}

# Require all applications
Dir["./apps/*.rb"].sort.each {|req| require req}