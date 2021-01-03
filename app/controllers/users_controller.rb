require 'pry'
class UsersController < ApplicationController

    def new
        @user = User.new
        #binding.pry
    end

    def create
        @user = User.find_or_create_by(name: params[:user][:name], email: params[:user][:email])
        @user.save
        redirect_to reviews_path(@user)
    end
end
