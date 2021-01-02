class BooksController < ApplicationController
    def index
        @book = Book.all
    end

    def show
        @bookid = Book.find(params[:id])
    end
end
