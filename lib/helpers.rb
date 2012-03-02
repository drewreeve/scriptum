module Scriptum
  module Helpers
    
    def page_title
      if @title
        "#{@title} ~ Scriptum"
      else
        "Scriptum"
      end
    end
    
    def post_template_for(post)
      type = post._type.downcase
      erb "#{type}/_#{type}".to_sym, :locals => {:post => post}
    end
    
    def post_url(post)
      "/post/#{post.slug}"
    end
    
  end
end