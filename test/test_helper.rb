ENV['RACK_ENV'] = 'test'
require File.dirname(__FILE__) + '/../init'
require 'test/unit'
require 'capybara/dsl'
require 'rack/test'

class AcceptanceTestCase < Test::Unit::TestCase
  include Capybara::DSL
  
  def setup  
    Capybara.app = Rack::Server.new(:config => File.dirname(__FILE__) + '/../config.ru').app
  end
  
  def teardown
    #Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end