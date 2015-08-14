require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:one)
  end

  test "POST create a user" do
    assert_difference('User.count', 1) do
      post :create, format: :json, user: { email: 'email@email.com', password: 'password', password_confirmation: 'password', first_name: 'Bob', last_name: 'Le Cat', phone_number: '555-555-5555' }
    end
    assert session[:user_id] = @user.id
    assert_response :success
  end

  # test "GET show a user" do
  #   get :show, id: @user, format: :json
  #   response_item = JSON.parse(response.body)
  #   ['id', 'email', 'password', 'password_confirmation', 'first_name', 'last_name', 'phone_number'].each do |attr|
  #   assert_equal @user.send(attr), response_item[attr]
  #   end
  #   assert_response :success
  # end

  test "PATCH update a user" do
    patch :update, format: :json, id: @user, user: { email: 'email@email.com', password: 'password', password_confirmation: 'password', first_name: 'Bob', last_name: 'Le Cat', phone_number: '545-5545-5454' }
    assert_response :success
  end

  # test "DELETE a user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, format: :json, id: @user
  #   end
  # end
end
