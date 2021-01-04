class BooksController < ApplicationController
    def create
       @book = Book.new(params) 
    end

    def new
        
    end
    
    def index
        @books = Book.all
    end

    def show
        @book = Book.find_by(params[:id])
    end
end
