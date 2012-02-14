module Scriptum
  module Helpers
    
    def title
      if @title
        "#{@title} ~ Scriptum"
      else
        "Scriptum"
      end
    end
    
  end
end