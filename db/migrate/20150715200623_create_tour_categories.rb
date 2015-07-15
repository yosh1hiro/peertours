class CreateTourCategories < ActiveRecord::Migration
  def change
    create_table :tour_categories do |t|
      t.integer :tour_id
      t.string :category

      t.timestamps null: false
    end
  end
end
