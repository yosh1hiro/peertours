class CreateTourRules < ActiveRecord::Migration
  def change
    create_table :tour_rules do |t|
      t.integer :tour_id
      t.string :name
      t.text :detail

      t.timestamps null: false
    end
  end
end
