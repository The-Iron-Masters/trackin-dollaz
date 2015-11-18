require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
  end

  test "POST create a user" do
    assert_difference('User.count', 1) do
      post :create, format: :json, user: { email: 'email@email.com', password: 'password', password_confirmation: 'password', first_name: 'Bob', last_name: 'Le Cat', phone_number: '555-555-5555' }
    end
  end

  test "PATCH update a user" do
    patch :update, format: :json, id: @user, user: { email: 'email@email.com', password: 'password', password_confirmation: 'password', first_name: 'Bob', last_name: 'Le Cat', phone_number: '545-5545-5454' }
    assert_response :success
  end

end
