require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
  end

  test "the fixture is valid" do
    assert @user.valid?
  end

  test "INvalid without first_name" do
    @user.first_name = nil
    refute @user.valid?
    assert @user.errors.keys.include?(:first_name)
  end

  test "INvalid without email" do
    @user.email = nil
    refute @user.valid?
    assert @user.errors.keys.include?(:email)
  end

  test "has many expenses" do
    assert_respond_to @user, :expenses
    assert_instance_of Expense, @user.expenses.new
  end

end
