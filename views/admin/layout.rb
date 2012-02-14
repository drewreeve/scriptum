module Scriptum
  class AdminApp
    module Views
      class Layout < Mustache
        include Scriptum::Helpers
        
        def title
          if @title
            "#{@title} ~ Scriptum Admin"
          else
            "Scriptum Admin"
          end
        end
        
      end
    end
  end
end