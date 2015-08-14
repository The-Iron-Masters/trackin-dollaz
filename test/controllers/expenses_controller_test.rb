require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase

  # def setup
  #   @user = users(:one)
  #   @expense = expenses(:one)
  # end
  #
  # test "GET index for all expenses" do
  #   get :index, id: @expense, format: :json
  #   response_item = JSON.parse(response.body)[0]
  #   ['user_id', 'name', 'amount', 'transaction_type', 'transaction_date'].each do |attr|
  #     assert_equal @expense.send(attr), response_item[attr]
  #   end
  #   assert_response :success
  # end
  #
  # test "POST create a new expense" do
  #   assert_difference('Expense.new', 1) do
  #     post :create, format: :json,  expense: { user_id: 1, name: 'Water Bill', amount: 62, transaction_type: 'Expense', transaction_date: '2015-08-02'}
  #   end
  #   assert_response :success
  # end
  #
  # test "PATCH update an expense" do
  #   patch :update, format: :json, id: @expense, expense: { user_id: 1, name: 'Water Bill', amount: 63, transaction_type: 'Expense', transaction_date: '2015-08-02' }
  #   assert_response :success
  # end
  #
  # test "DELETE an expense" do
  #   assert_difference('Expense.count', -1) do
  #     delete :destroy, format: :json, id: @expense
  #   end
  # end
  #

end
