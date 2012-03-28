module Scriptum
  class BlogApp < Base
    
    set :views, ["views/blog", "views/post_types"]
    
    get '/' do
      @posts = Post.where(:published => true).sort(:created_at.desc).limit(10)
      erb :index
    end
    
    get '/post/:slug' do
      @post = Post.find_by_slug!(params[:slug])
      @page_title = @post.title
      erb :detail
    end
    
  end
end
