class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :request_id
      t.text :body
      t.string :relationship

      t.timestamps null: false
    end
  end
end
