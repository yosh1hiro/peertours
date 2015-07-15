class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer :host_id
      t.string :name
      t.text :outline
      t.text :description
      t.integer :minimum_number
      t.integer :maximum_number
      t.string :rendezvous

      t.timestamps null: false
    end
  end
end
