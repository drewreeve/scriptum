module Scriptum
  
  class Base < Sinatra::Base
    register Mustache::Sinatra    
    set :root, File.expand_path("../..", __FILE__)
    enable :method_override
    
    set :mustache, {
      :views => settings.root + '/views',
      :templates => settings.root + '/templates'
    }
    
  end

end