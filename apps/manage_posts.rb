require_relative './admin'

module Scriptum
  class ManagePostsApp < AdminApp
    
    set :views, ["views/manage_posts", "views/admin", "views/post_types"]
  
    get '/' do
      @posts = Post.sort(:created_at.desc).paginate(
        :per_page => 15, :page => params[:page] || 1
      )
      erb :index
    end
    
    get '/new/:type' do
      raise not_found unless valid_post_type?(params[:type])
      @post = build_post(params[:type], params[:post])
      @page_title = "New Post"
      erb :new
    end
    
    post '/' do
      raise not_found unless valid_post_type?(params[:type])
      @post = build_post(params[:type], params[:post])
      
      if @post.save
        flash[:success] = "Post created"
        redirect to('/')
      else
        @page_title = "New Post"
        erb :new
      end
    end
    
    get '/:slug/edit' do
      @post = Post.where(:slug => params[:slug]).first
      @page_title = "Editing #{@post.title}"
      erb :edit
    end
    
    put '/:slug' do
      @post = Post.where(:slug => params[:slug]).first
      if @post.update_attributes(params[:post])
        flash[:success] = "Post updated"
        redirect to("/")
      else
        @page_title = "Edit Post"
        erb :edit
      end
    end
  
  end
end