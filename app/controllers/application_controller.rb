class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def home
         redirect_to login_path
    end

    def index
        
    end

    # def home
    #     redirect_to login_path
    # end

    

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end


     def logged_in?
       !!current_user
     end

   

end
