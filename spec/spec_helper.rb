ENV['RACK_ENV'] = 'test'
require_relative '../init'
require 'rspec'
require 'capybara/rspec'
require 'rack/test'
require 'factory_girl'
require 'factories'

Dir['./spec/support/**/*.rb'].map {|f| require f}

Capybara.app = Rack::Server.new(:config => File.dirname(__FILE__) + '/../config.ru').app

# Bit hackish, but it speeds up tests massively
BCrypt::Engine.send(:remove_const, :DEFAULT_COST)
BCrypt::Engine.const_set(:DEFAULT_COST, 1)

module SpecHelpers
  
  def sign_in_user(role=:admin, username='bob',pass='password')
    u = create(:user, role.to_sym, :username => username, :password => pass)
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
