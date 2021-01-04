class ApplicationController < ActionController::Base
    helper_method :current_user
    def home
        redirect_to login_path
    end

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end

    # def logged_in?
    #     session.delete(@user)
    #     @current_user = nil
    # end
end
