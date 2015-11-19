require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  
  def setup 
    @movie = Movie.new(title: "Example Movie", category: "Comedy", description: "A" * 16)
  end
  
  test "should be valid" do
    assert @movie.valid?
  end
  
  test "title should be present" do
    @movie.title = " "
    assert_not @movie.valid?
  end
  
  test "long titles should be invalid" do
    @movie.title = "a" * 51
    assert_not @movie.valid?
  end
  
  test "short title should be valid" do
    @movie.title = "Example"
    assert @movie.valid?
  end
  
  test "description should be present" do
    @movie.description = " "
    assert_not @movie.valid?
  end
  
  test "description should not be too short" do
    @movie.description = "a" * 13
    assert_not @movie.valid?
  end
  
  test "category should be present" do
    @movie.category = " "
    assert_not @movie.valid?
  end
end
