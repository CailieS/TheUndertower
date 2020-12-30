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

end
