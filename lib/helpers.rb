module Scriptum
  module Helpers
    
    def page_title
      if @title
        "#{@title} ~ Scriptum"
      else
        "Scriptum"
      end
    end
    
  end
end