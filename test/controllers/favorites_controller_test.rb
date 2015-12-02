require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  
  def setup 
    @critic = critics(:Bill)
    @movie = movies(:Robocop)
    @favorite = @critic.favorites.create(movie: @movie)
  end
  
  test "Should create new favorite and destroy it" do
    assert_difference 'Favorite.count' do
      log_in_as(@critic)
      post :create, movie_id: @movie.id 
    end
  end
  
  test "Should destroy a favorite" do
    assert_difference 'Favorite.count', -1 do
      log_in_as(@critic)
      @favorite.destroy
    end
  end
      
end
