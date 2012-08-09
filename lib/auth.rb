module Scriptum
  module Auth
    
    def logged_in?
      !current_user.nil?
    end
    
    def current_user
      @current_user ||= User.find(session[:user]) if session[:user]
    end

    def authorize!(*roles)
      redirect_to_login unless logged_in?
      if roles.empty?
        true
      else
        deny_access unless roles.include?(current_user.role.to_sym)
      end
    end

    def redirect_to_login
      redirect "sessions/new"
    end

    def deny_access
      flash[:info] = "You do not have permission to do that"
      redirect "/admin"
    end
    
  end
end
