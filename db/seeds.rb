# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  expense = Expense.create(
  name:             Faker::Commerce.product_name,
  amount:           Faker::Commerce.price,
  transaction_type: "expense"
  )
end

2.times do
  expense = Expense.create(
  name:             Faker::Company.name,
  amount:           Faker::Number.number(4),
  transaction_type: "income"
  )
end
