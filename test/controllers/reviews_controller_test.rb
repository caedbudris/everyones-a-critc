require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  
  def setup 
    @critic = critics(:Bill)
    @movie = movies(:Robocop)
  end
  
  test "should create a review" do
    assert_difference 'Review.count' do
      log_in_as @critic
      post :create, movie: { critic_id: @critic.id, movie_id: @movie.id, content: 'a' * 40 }
    end
  end
  
end
