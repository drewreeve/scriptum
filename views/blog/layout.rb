module Scriptum
  module Views
    class Layout < Mustache
      
      def title
        if @title
          "#{@title} ~ Scriptum"
        else
          "Scriptum"
        end
      end
      
    end
  end
end