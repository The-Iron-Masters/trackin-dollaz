require 'test_helper'

class ExpenseFormTest < ActionDispatch::IntegrationTest
  test 'the page loads' do
    visit '/'
    assert page.has_selector?('[data-js="expenses"]')
    assert page.has_content?('Loading...')
  end

  # test 'creating a new task' do
  #   name = Faker::Name.name
  #   current_rate = Faker::Number.number(1)
  #   start = DateTime.now.to_s(:db)
  #   stop = (DateTime.now + 2.hours).to_s(:db)
  #
  #   js do
  #     visit '/'
  #
  #     fill_in 'Name', with: name
  #     fill_in 'Current Rate', with: current_rate
  #     fill_in 'Start', with: start
  #     fill_in 'Stop', with: stop
  #     click_on 'Submit'
  #
  #     within 'table' do
  #       assert page.has_content?(name)
  #       assert page.has_content?(current_rate)
  #       assert page.has_content?(DateTime.parse(start).try(:strftime, '%D %r'))
  #       assert page.has_content?(DateTime.parse(stop).try(:strftime, '%D %r'))
  #     end
  #   end
  # end
end
