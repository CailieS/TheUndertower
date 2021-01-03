require 'pry'
class ReviewsController < ApplicationController
    def new
       @review = Review.new 
    end

    def create
        #byebug
        review = Review.create(title: params[:show][:title], review: params[:show][:review])
        redirect_to reviews_path(@review)
        if @review.save
            redirect_to review_path(@review)
        else
            redirect_to review_path
        end
    end

    def index
        if params[:book_id]
            @review = Book.find(params[:author_id])
            @book = @book.reviews
            if !@review
                redirect_to kitchen_path, alert: "What you're looking for isn't here! Please try again."
            else
                @book = @book.reviews
            end
        else
            @review = Review.all
        end
    end

    def show
        if params[:book_id]
        @book =  Book.find(id: params[:book_id])
        @review = @book.book.find(id: params[:id])
        if @review == nil 
            redirect_to reviews_path(@book)
         end
        else
            @review = Review.find(id: params[:id])
        end
    end

    def edit
        @review =  Review.find(id: params[:id])
    end

    def update
        review = Review.find(id: params[:id])
        review.update(title: params[:show][:title], review: params[:show][:review])
        redirect_to reviews_path(review)
    end

    def destroy
        @review.destroy
        redirect_to review_path(@review)
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :review)
    end
end
