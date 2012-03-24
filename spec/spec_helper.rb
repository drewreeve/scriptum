ENV['RACK_ENV'] = 'test'
require_relative '../init'
require 'rspec'
require 'capybara/rspec'
require 'rack/test'
require 'factory_girl'
require 'factories'

Dir['./spec/support/**/*.rb'].map {|f| require f}

Capybara.app = Rack::Server.new(:config => File.dirname(__FILE__) + '/../config.ru').app

module SpecHelpers
  
  def sign_in_user(username='bob',pass='password')
    u = create(:user, :username => username, :password => pass)
    visit "/sessions/new"
    fill_in 'username', :with => username
    fill_in 'password', :with => pass
    click_on 'Sign in'
  end
  
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include SpecHelpers
  config.include FactoryGirl::Syntax::Methods
  
  config.after do
    MongoMapper.database.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end
