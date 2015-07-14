class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :sex
      t.integer :birthdate_1
      t.integer :birthdate_2
      t.integer :birthdate_3
      t.text :description
      t.string :remember_token
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
