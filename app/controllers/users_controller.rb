require 'pry'
class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
       
        if @user.save
            redirect_to review_path(@user)
        else
            redirect_to reviews_new_path
        end
    end

    def show

    end


end
