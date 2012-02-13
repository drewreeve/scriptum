module Scriptum
  class Blog < Base
    
    set :mustache, {
      :views => settings.root + '/views/blog',
      :templates => settings.root + '/templates/blog',
    }
    
    get '/' do
      mustache :index
    end
    
  end
end