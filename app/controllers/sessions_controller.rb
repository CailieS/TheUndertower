require 'pry'
class SessionsController < ApplicationController

def home
    if logged_in?

        @reviews = current_user.reviews
    else
        redirect_to login_path
    end
end

def new
    
end

def create
    @user = User.find_by(email: params[:user][:email])
    #binding.pry
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        flash[:error] = "Please try again"
       redirect_to login_path 
    end
end

def login_with_fb
    user = User.find_or_create_by(name: auth['email']) do |u|
        #binding.pry
    u.password = 'password'
    end
    user.save
    session[:user_id] = user.id
    redirect_to books_path
end

def destroy
    session.delete(:user_id)
    redirect_to root_path
end

private

def auth
    request.env['omniauth.auth']['info']
end

end

