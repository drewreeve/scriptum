require 'yaml'

module Scriptum
  module Config
    
    def self.[](key)
      unless @config
        root = File.expand_path('..', File.dirname(__FILE__))
        environment = ENV['RACK_ENV'] || 'development'
        @config = YAML.load(File.read(root + '/config/settings.yml'))[environment]
      end
      
      @config[key.to_s]
    end

  end
end
