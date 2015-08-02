class CreateTourPrices < ActiveRecord::Migration
  def change
    create_table :tour_prices do |t|
      t.integer :tour_id
      t.integer :number
      t.integer :price

      t.timestamps null: false
    end
  end
end
