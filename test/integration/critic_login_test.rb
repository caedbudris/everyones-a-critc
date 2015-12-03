require 'test_helper'

class CriticLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @critic = critics(:Bill)
  end
  
  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: '', password: '' }
    assert_template 'sessions/new'
  end
  
  test "login with valid info" do
    get login_path 
    assert_template 'sessions/new'
    post login_path, session: { email: @critic.email, password: 'password' }
    assert_redirected_to @critic
    follow_redirect!
    assert_template 'critics/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", critic_path(@critic)
  end

end