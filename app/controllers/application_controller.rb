class ApplicationController < ActionController::Base

    def home
         redirect_to login_path
    end

    def index
        
    end

    helper_method :current_user, :logged_in?

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end

     def logged_in?
       !!current_user
     end
end
