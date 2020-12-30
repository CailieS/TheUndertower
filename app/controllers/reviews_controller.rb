class ReviewsController < ApplicationController
    def new
       @review = Review.new 
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path
        else
            redirect_to reviews_new_path
        end
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :review)
    end
end
