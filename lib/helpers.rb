module Scriptum
  module Helpers
    
    def page_title(*args)
      args.compact.join(" | ")
    end
    
    def google_analytics(tracking_code=nil)
      unless tracking_code.blank?
        <<-HTML
        <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', '#{tracking_code}']);
          _gaq.push(['_trackPageview']);
          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
        </script>
        HTML
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
