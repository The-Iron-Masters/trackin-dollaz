class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer   :user_id
      t.string    :name,              null: false
      t.integer   :amount,            null: false
      t.string    :transaction_type,  null: false
      t.date      :transaction_date
      t.timestamps                    null: false
    end
  end
end
