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
    
    def form_template_for(post)
      type = post._type.downcase
      erb "#{type}/_form".to_sym, :locals => {:post => post}
    end
    
    def post_url(post)
      "/post/#{post.slug}"
    end
    
    def pagination(collection)
      return unless collection.total_pages > 1
      erb :_pagination, :locals => {:collection => collection}
    end
    
    def valid_post_type?(post_type)
      Post.subclasses.map(&:to_s).include?(post_type.to_s.capitalize)
    end
    
    def build_post(klass, params)
      Object.const_get(klass.to_s.capitalize).new(params)
    end
    
  end
end