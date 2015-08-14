class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :first_name, null: false
      t.string :last_name
      t.string :phone_number
      t.string :csv

      t.timestamps null: false
    end
  end
end
