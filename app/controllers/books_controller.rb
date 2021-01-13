class BooksController < ApplicationController
    def new
        @book = Book.new
    end
    
    def create
       @book = Book.new(book_params)
       @book.save
       redirect_to books_path
    end

    def index
        @books = Book.all
    end

    def show
        @book = Book.find_by(params[:id])
    end

    private

    def book_params
        params.require(:books).permit(:title, :author, :image_url)
    end
end
