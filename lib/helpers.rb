module Scriptum
  module Helpers
    
    def page_title(title=nil,suffix=Scriptum::Config[:site_name])
      if title
        "#{title} ~ #{suffix}"
      else
        suffix
      end
    end
    
    def post_template_for(post, template=nil)
      type = post._type.downcase
      erb "#{type}/_#{template || type}".to_sym, :locals => { :post => post }
    end
    
    def form_template_for(post)
      type = post._type.downcase
      erb "#{type}/_form".to_sym, :locals => {:post => post}
    end
    
    def post_url(post)
      "/post/#{post.slug}"
    end

    # TODO: Move these methods into a pagination class
    def page_url(page_number=1)
      "?#{escape_html(request.params.merge('page' => page_number).to_param)}"
    end

    def current_page(path)
      "active" if request.script_name == path
    end
    
    def pagination(collection)
      return unless collection.total_pages > 1
      erb :_pagination, :locals => {
        :collection => collection,
        :pages => paginate_pages(collection)
      }
    end

    def paginate_pages(collection)
      ary = (collection.current_page-4..collection.current_page+4).to_a
      ary.reject { |n| !n.between?(1,collection.total_pages) }
    end
    
    def valid_post_type?(post_type)
      Post.subclasses.map(&:to_s).include?(post_type.to_s.capitalize)
    end
    
    def build_post(klass, params)
      Object.const_get(klass.to_s.capitalize).new(params)
    end
    
  end
end
