class CreateTourPhotos < ActiveRecord::Migration
  def change
    create_table :tour_photos do |t|
      t.integer :tour_id
      t.string :url

      t.timestamps null: false
    end
  end
end
