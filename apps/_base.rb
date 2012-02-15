module Scriptum
  
  class Base < Sinatra::Base
    register Mustache::Sinatra    
    set :root, File.expand_path("../..", __FILE__)
    enable :method_override
    
    set :mustache, {
      :views => settings.root + '/views',
      :templates => settings.root + '/templates'
    }
    
    before do
      cache_control :private, :must_revalidate, :max_age => 0
    end
    
  end

end