module Scriptum
  class BlogApp < Base
    
    set :views, ["views/blog"]
    
    get '/' do
      erb :index
    end
    
  end
end