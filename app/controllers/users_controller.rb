require 'pry'
class UsersController < ApplicationController

    def new
        @user = User.new
        #binding.pry
    end

    def create
        @user = User.new
       
        if @user.save
            #binding.pry
            redirect_to review_path(@user)
        else
            redirect_to root_path
        end
    end

    def show

    end


end
