require 'pry'
class UsersController < ApplicationController

    def new
        @user = User.new
        #binding.pry
    end
    
    # def create 
    #     user = User.find_by(username: params[:user][:name]) 
    #     if user && user.authenticate(params[:user][:email])
    #          binding.pry
    #         session[:user_id] = user.id 
    #         redirect_to books_path
    #     else
    #        render :new
    #     end 
    # end
end
