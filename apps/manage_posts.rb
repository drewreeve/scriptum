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
  
  end
end