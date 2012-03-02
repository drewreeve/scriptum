require 'yaml'

module Scriptum
  module Config
    
    def self.[](key)
      unless @config
        root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

        @config = begin
          YAML.load(File.read(root+"/config/settings.yml"))[ENV['RACK_ENV']||'development']
        rescue Errno::ENOENT
          YAML.load(File.read(root+"/config/settings.default.yml"))[ENV['RACK_ENV']||'development']
        end
      end
      
      @config[key.to_s]
    end
    
  end
end