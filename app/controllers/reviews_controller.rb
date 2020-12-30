class ReviewsController < ApplicationController
    def new
       @review = Review.new 
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            redirect_to reviews_new_path
        end
    end

    def index
        @review = Review.all
    end

    def show
        @review =  Review.find(params[:id])
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :review)
    end
end
