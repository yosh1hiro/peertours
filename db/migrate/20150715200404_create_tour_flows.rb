class CreateTourFlows < ActiveRecord::Migration
  def change
    create_table :tour_flows do |t|
      t.integer :tour_id
      t.text :flow

      t.timestamps null: false
    end
  end
end
