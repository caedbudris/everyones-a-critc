class FavoritesController < ApplicationController
    
    def create
        @movie = Movie.find(params[:movie_id])
        current_critic.favorite(@movie)
        respond_to do |format|
            format.html { redirect_to current_critic }
            format.js
        end
    end
    
    #def destroy
    #    movie = Movie.find(params[:movie_id])
    #    current_critic.un_favorite(movie)
    #    redirect_to current_critic
    #end
    
    def destroy
        @movie = Favorite.find(params[:id]).movie
        favorite = current_critic.favorites.find(params[:id])
        favorite.destroy
        respond_to do |format|
            format.html { redirect_to current_critic }
            format.js
        end
    end
    
end
