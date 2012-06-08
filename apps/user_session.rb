module Scriptum
  class UserSessionApp < Base
    
    set :views, ["views/user_session"]
    
    get '/new' do
      @page_title = "Sign In"
      erb :login
    end
    
    post '/create' do
      if user = User.authenticate(params[:username], params[:password])
        session[:user] = user.id
        flash[:success] = "You were signed in successfully"
        erb :login
        redirect '/admin'
      else
        flash[:error] = "Invalid username or password"
        redirect '/sessions/new'
      end
    end
    
    get '/logout' do
      if logged_in?
        session[:user] = nil
        flash[:success] = "You were signed out"
      else
        flash[:info] = "You can't sign out if you're not signed in foo'!!"
      end
      redirect '/'
    end
    
  end
end
