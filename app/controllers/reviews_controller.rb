require 'pry'
class ReviewsController < ApplicationController
    before_action :require_login
    
 
    
    def new
        @book = Book.find_by_id(params[:id])
       # binding.pry
       @review = @book.build_review

#         # if params[:book_id] && @review = Book.find(params[:book_id])
#             @review = @book.review.build
#   #         redirect_to book_path, alert: "What you're looking for isn't here! Please try again."
#          else
#             @review = Review.new
#         end
    end

    def create 
     @review = Review.new(review_params)
     @review.user_id = session[:user_id]
    if @review.save!
        redirect_to review_path(@review) 
     end
   end

    def index
        # if params[:book_id] && @review = Book.find(params[:book_id])
        #     @reviews = @book.reviews
        #     redirect_to book_path, alert: "What you're looking for isn't here! Please try again."
        # else
            @reviews = Review.all
        #end
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
        review.update(review_params)
        redirect_to reviews_path(review)
    end

    def destroy
        @review.destroy
        redirect_to review_path(@review)
    end

    private
    
    def review_params
        params.require(:review).permit(:title, :review, :book_id, :brand_attributes)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
      end
end
