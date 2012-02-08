module Scriptum
  
  class Base < Sinatra::Base
    
    set :root, File.dirname(__FILE__)
    enable :method_override
    
  end

end