class ReviewsController < ApplicationController
    
    def create
        #@movie = Review.find(params[:id]).movie
        current_critic.reviews.create(review_params)
        redirect_to movies_path
    end
    
    def destroy
        @review = current_critic.reviews.find(params[:id])
        @review.delete
        redirect_to @movie
    end
    
    private
    
        def review_params
            params.require(:review).permit(:content, :movie_id)
        end
    
end
