json.array! @expenses.each do |expense|
  json.id                 expense.id
  json.user_id            expense.user_id
  json.name               expense.name
  json.amount             expense.amount
  json.transaction_type   expense.transaction_type
  json.transaction_date   expense.transaction_date
end
