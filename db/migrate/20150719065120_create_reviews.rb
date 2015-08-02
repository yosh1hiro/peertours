class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :trip_id
      t.integer :user_id
      t.integer :tour_id
      t.text :body
      t.integer :rating

      t.timestamps null: false
    end
  end
end
