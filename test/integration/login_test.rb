require 'test_helper'

class ExpenseFormTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test 'the page loads' do
    visit '/'
    assert page.has_content?('Login')
  end

  test 'can login' do
    js do
      visit '/'

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'password'
      click_on 'Submit'
    end
  end
end
