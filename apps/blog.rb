module Scriptum
  class BlogApp < Base
    
    set :views, ["views/blog", "views/post_types"]
    
    get '/' do
      @posts = Post.where(:published => true).sort(:created_at.desc).
        paginate(:per_page => 10, :page => params[:page] || 1)
      erb :index
    end
    
    get '/post/:slug' do
      @post = Post.find_by_slug!(params[:slug])
      @page_title = @post.title
      erb :detail
    end

    get '/feed' do
      @posts = Post.where(:published => true).sort(:created_at.desc).limit(10)
      builder :feed
    end
    
  end
end
