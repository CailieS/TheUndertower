class SessionsController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.find_by(name: params[:user][:name], email: params[:user][:email])
    if @user && @user.authenticate(password: params[:user][:password])
        sessions[:user_id] = @user.id
        redirect_to user_path(@user)
    else
       render :new 
    end
end

def login_with_fb
    user = User.find_or_create_by(username: auth['email']) do |u|
    u.password = 'password'
    end
    user.save
    session[:user_id] = user.id
    redirect_to books_path
end

def destroy
    session.clear
    redirect_to '/'
end

private

def auth
    request.env['omniauth.auth']['info']
end

end
