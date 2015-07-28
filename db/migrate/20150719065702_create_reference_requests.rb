class CreateReferenceRequests < ActiveRecord::Migration
  def change
    create_table :reference_requests do |t|
      t.integer :recipient_id
      t.integer :sender_id

      t.timestamps null: false
    end
  end
end
