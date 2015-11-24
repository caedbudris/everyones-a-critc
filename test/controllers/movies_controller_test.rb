require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  
  def setup
    @movie = movies(:Robocop)
  end
  
  test 'Should get index' do
    get :index
    assert_response :success
  end
  
  test 'Should get new' do
    get :new
    assert_response :success
  end
  
  test 'Should get edit' do
    get :edit, id: @movie
    assert_response :success
  end
  
  test 'Should create a new movie' do
    assert_difference 'Movie.count' do
      post :create, movie: { title: 'Some Title', category: 'Action', description: 'Description' * 5 }
    end
    assert_redirected_to movie_path(assigns(:movie))
  end
  
end
