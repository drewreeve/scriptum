module Scriptum
  module Auth
    
    def logged_in?
      !current_user.nil?
    end
    
    def current_user
      @current_user ||= User.find(session[:user]) if session[:user]
    end
    
    def require_authentication
      unless logged_in?
        redirect "/sessions/new"
      end
    end
    
  end
end