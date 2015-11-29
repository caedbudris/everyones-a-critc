require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  
  def setup
    @movie = movies(:Robocop)
  end
  
  test 'Should get show' do
    get :show, id: @movie
    assert_response :success
  end
  
  test 'Should get index' do
    get :index
    assert_response :success
  end
  
  test 'Should get index with search' do
    get :index, search: 'Robocop'
    assert_equal((assigns(:movies)).count, 1)
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
  
  test 'Should get categorize' do
    get :categorize, category: @movie.category
    assert_response :success
    assert_equal @movie.category, assigns(:category)
  end
  
  test "Should destroy movie" do
    assert_difference 'Movie.count', -1 do
      @movie.destroy
    end
  end
  
end
