module Scriptum
  class BlogApp < Base
    
    require_relative '../views/blog/layout'
    
    set :mustache, {
      :views => settings.root + '/views/blog',
      :templates => settings.root + '/templates/blog',
    }
    
    get '/' do
      mustache :index
    end
    
  end
end