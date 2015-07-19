class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :guest_id
      t.integer :tour_id
      t.date :appointment_date
      t.string :status
      t.integer :guest_number

      t.timestamps null: false
    end
  end
end
