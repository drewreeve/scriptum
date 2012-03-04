module Scriptum
  module Helpers
    
    def page_title
      if @page_title
        "#{@page_title} ~ #{Scriptum::Config[:site_name]}"
      else
        Scriptum::Config[:site_name]
      end
    end
    
    def post_template_for(post)
      type = post._type.downcase
      erb "#{type}/_#{type}".to_sym, :locals => {:post => post}
    end
    
    def post_url(post)
      "/post/#{post.slug}"
    end
    
    def pagination(collection)
      return unless collection.total_pages > 1
      erb :_pagination, :locals => {:collection => collection}
    end
    
  end
end