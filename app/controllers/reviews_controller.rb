class ReviewsController < ApplicationController
    def new
       @review = Review.new 
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            redirect_to reviews_path
        end
    end

    def index
        if params[:book_id]
            @review = Book.find(params[:author_id]).posts
        else
            @review = Post.all
        end
    end

    def show
        @review =  Review.find(params[:id])
    end

    def edit
        @review =  Review.find(params[:id])
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
