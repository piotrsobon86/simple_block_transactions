class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount, null: false
      t.integer :to_user_id, null: false
      t.string :to_user_address, null: false
      t.string :from_address, null: false
      t.string :currency, null: false
      t.string :status, null: false, default: 'pending'
      t.json :response

      t.timestamps
    end
  end
end
