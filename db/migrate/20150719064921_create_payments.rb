class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :reservation_id

      t.timestamps null: false
    end
  end
end
