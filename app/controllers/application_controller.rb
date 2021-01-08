class ApplicationController < ActionController::Base
<<<<<<< HEAD

    def home
         redirect_to login_path
    end

    def index
        
    end
=======
    helper_method :current_user, :logged_in?
    # def home
    #     redirect_to login_path
    # end
>>>>>>> 53d743131011bbf656c1e61a2337a4072e0e6167

    helper_method :current_user, :logged_in?

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end

<<<<<<< HEAD
     def logged_in?
       !!current_user
     end
=======
    def logged_in?
        !!current_user
    end
>>>>>>> 53d743131011bbf656c1e61a2337a4072e0e6167
end
