ENV['RACK_ENV'] = 'test'
require_relative '../init'
require 'rspec'
require 'capybara/rspec'
require 'rack/test'
require 'factory_girl'
require 'factories'

Dir['./spec/support/**/*.rb'].map {|f| require f}

Capybara.app = Rack::Server.new(:config => File.dirname(__FILE__) + '/../config.ru').app

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  
  conf.after do
    MongoMapper.database.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
