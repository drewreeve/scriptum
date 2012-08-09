module Scriptum
  class AdminApp < Base
    
    set :views, ["views/admin"]
    
    before do
      authorize!
    end
    
    get '/' do
      erb :index
    end
    
  end
end
