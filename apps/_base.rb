module Scriptum
  
  class Base < Sinatra::Base

    set :root, File.expand_path("../..", __FILE__)
    enable :method_override
    
    use Rack::Session::Cookie,
      :secret => Config['secret']
    
    use Rack::Flash, :sweep => true
    
    helpers Scriptum::Auth
    helpers Scriptum::Helpers
    
    helpers do
      def find_template(views, name, engine, &block)
        Array(views).each { |view| super(view, name, engine, &block) }
      end

      def fetch_settings
        @settings = Setting.first
        if @settings.nil?
          Setting.new.save
          @settings = Setting.first
        end
      end
    end
    
    before do
      cache_control :private, :must_revalidate, :max_age => 0
      fetch_settings
    end
    
    not_found do
      @page_title = "404 Not Found"
      erb :'404', :layout => false, :views => settings.root + '/views'
    end

    error MongoMapper::DocumentNotFound do
      @page_title = "404 Not Found"
      erb :'404', :layout => false, :views => settings.root + '/views/'
    end
    
  end

end
