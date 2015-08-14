class Expense < ActiveRecord::Base
  belongs_to :user

  validates :name, :amount, :transaction_type, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
