require 'bundler/setup'
Bundler.require(:default)

# Require all applications
Dir["./apps/*.rb"].sort.each {|req| require req}