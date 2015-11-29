require 'test_helper'

class CriticsControllerTest < ActionController::TestCase
    require 'test_helper'
    
    def setup
        @critic = critics(:Bill)
    end
    
    test "Should get show" do
        get :show, id: @critic
        assert_response :success
    end
    
    test "Should get edit" do
        log_in_as(@critic)
        get :edit, id: @critic
        assert_response :success
    end
    
    test "Should get new" do
        get :new
        assert_response :success
    end
    
    test "Should get index" do
        get :index
        assert_response :success
    end
    
    test "Should get create critic" do
        assert_difference 'Critic.count' do
            post :create, critic: { name: 'James Critic', email: 'james@example.com', password: 'thisisapassword' }
        end
        assert_redirected_to critic_path(assigns(:critic))
    end
    
    test "Should destroy a critic" do
        assert_difference 'Critic.count', -1 do
            @critic.destroy
        end
    end

end
