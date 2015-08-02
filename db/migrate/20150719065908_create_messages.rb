class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :message
      t.boolean :read
      t.integer :message_thread_id

      t.timestamps null: false
    end
  end
end
