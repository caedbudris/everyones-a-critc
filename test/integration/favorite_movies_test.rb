require 'test_helper'

class FavoriteMoviesTest < ActionDispatch::IntegrationTest
  
  def setup
    @critic = critics(:Bill)
    @movie = movies(:Robocop)
  end
  
  test "Should favorite a movie" do
      post login_path, session: { email: @critic.email, password: 'password' }
      assert_difference '@critic.favorites.count' do
        xhr :post, favorites_path, movie_id: @movie.id
      end
  end
  
  test "Should un-favorite a movie" do
    post login_path, session: { email: @critic.email, password: 'password' }
    @critic.favorite(@movie)
    favorite = @critic.favorites.find_by(movie_id: @movie.id)
    assert_difference '@critic.favorites.count', -1 do
      xhr :delete, favorite_path(favorite)
    end
  end
  
end
