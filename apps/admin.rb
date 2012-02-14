module Scriptum
  class Admin < Base
    
    require_relative '../views/admin/layout'
    
    set :mustache, {
      :views => settings.root + '/views/admin',
      :templates => settings.root + '/templates/admin'
    }
    
    get '/' do
      mustache :index
    end
    
  end
end