module Scriptum
  module Config

    root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
    file = File.exists?("#{root}/config/settings.yml") ? 
             "#{root}/config/settings.yml" : "#{root}/config/settings.default.yml"

    unless @config
      @config = YAML.load(ERB.new(File.new(file).read).result)[ENV['RACK_ENV']||'development']
    end

    def self.[](key)
      @config[key]
    end

    def self.[]=(key, value)
      @config[key] = value
    end

    def self.as_hash
      @config
    end
  end
end