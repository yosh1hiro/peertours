class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.integer :host_id
      t.integer :guest_id

      t.timestamps null: false
    end
  end
end
