require 'test_helper'

class CriticTest < ActiveSupport::TestCase
  
  def setup
    @critic = Critic.new(name: "Bob Jones", email: "bobjones@example.com", password: "foobar", password_confirmation: "foobar")
  end
  
  test "valid critic should be valid" do
    assert @critic.valid?
  end
  
  test "Name should be present" do
    @critic.name = " "
    assert_not @critic.valid?
  end
  
  test "Name should not be too long" do
    @critic.name = "a" * 31
    assert_not @critic.valid?
  end
  
  test "Email should be present" do
    @critic.email = " "
    assert_not @critic.valid?
  end
  
  test "Valid emails should be valid" do
    valid_addresses = %w[jesus@christ.com jesus.christ@lord.net DAN@dan.face jesus+CHRIST@heaven.com]
    valid_addresses.each do |valid_address|
      @critic.email = valid_address
      assert @critic.valid?, "#{valid_address} should be valid"
    end
  end
  
  test "Invalid emails should be invalid" do
    invalid_addresses = %w[jesus@chris. lord.almighty@jesus+christ.com jesuslord@jesus_christ.com]
    invalid_addresses.each do |invalid_address|
      @critic.email = invalid_address
      assert_not @critic.valid?, "#{invalid_address} should not be valid"
    end
  end
  
  #test "email addresses should be unique" do
  #  duplicate_critic = @critic.dup
  #  duplicate_critic.email = @critic.email.upcase
  #  @critic.save
  #  assert_not duplicate_critic.valid?
  #end
  
  test "Passwords should not be too short" do
    @critic.password = @critic.password_confirmation = "a" * 5
    assert_not @critic.valid?
  end
    
end
