module Scriptum
  module Helpers
    
    def page_title
      if @page_title
        "#{@page_title} ~ #{Scriptum::Config[:site_name]}"
      else
        Scriptum::Config[:site_name]
      end
    end
    
    def post_template_for(post, template=nil)
      type = post._type.downcase
            
      if template
        erb "#{type}/_#{template}".to_sym, :locals => {:post => post}
      else
        erb "#{type}/_#{type}".to_sym, :locals => {:post => post}
      end
    end
    
    def form_template_for(post)
      type = post._type.downcase
      erb "#{type}/_form".to_sym, :locals => {:post => post}
    end
    
    def post_url(post)
      "/post/#{post.slug}"
    end
    
    def current_page(path)
      return "active" if request.script_name == path
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