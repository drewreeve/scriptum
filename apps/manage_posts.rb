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
      not_found unless valid_post_type?(params[:type])
      @post = build_post(params[:type], params[:post])
      @page_title = "New Post"
      erb :new
    end
    
    post '/' do
      not_found unless valid_post_type?(params[:type])
      @post = build_post(params[:type], params[:post])
      @post.user = current_user      
      if @post.save
        flash[:success] = "Post created"
        redirect to('/')
      else
        @page_title = "New Post"
        erb :new
      end
    end
    
    get '/:slug/edit' do
      @post = Post.find_by_slug!(params[:slug])
      @page_title = "Editing #{@post.title}"
      erb :edit
    end
    
    put '/:slug' do
      @post = Post.find_by_slug!(params[:slug])
      if @post.update_attributes(params[:post])
        flash[:success] = "Post updated"
        redirect to("/")
      else
        @page_title = "Edit Post"
        erb :edit
      end
    end
    
    get '/:slug/delete' do
      @post = Post.find_by_slug!(params[:slug])
      erb :delete
    end
    
    delete '/:slug' do
      @post = Post.find_by_slug!(params[:slug])
      flash[:success] = "Post deleted" if @post.destroy
      redirect to('/')
    end
  
  end
end
