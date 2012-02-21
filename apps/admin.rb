module Scriptum
  class AdminApp < Base
    
    set :views, ["views/admin"]
    
    before do
      require_authentication
    end
    
    get '/' do
      erb :index
    end
    
  end
end