require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  require 'test_helper'

  def setup
    @expense = expenses(:one)
  end

  test "the fixture is valid" do
    assert @expense.valid?
  end

  test "INvalid without name" do
    @expense.name = nil
    refute @expense.valid?
    assert @expense.errors.keys.include?(:name)
  end

  test "INvalid without amount" do
    @expense.amount = nil
    refute @expense.valid?
    assert @expense.errors.keys.include?(:amount)
  end

  test "amount must be a number" do
    @expense.amount = "one"
    refute @expense.valid?
    assert @expense.errors.keys.include?(:amount)
  end

  test "amount canNOT be a negative" do
    @expense.amount = -2
    refute @expense.valid?
    assert @expense.errors.keys.include?(:amount)
  end

  test 'belongs to a user' do
    @expense.user = users(:one)
    assert_respond_to @expense, :user
    assert_instance_of User, @expense.user
  end

end
