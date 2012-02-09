module Scriptum
  class Blog < Base
    
    get '/' do
      mustache :index
    end
    
  end
end