class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      # t.string :password
      t.string :name
      t.string :city
      t.string :password_digest
      t.boolean :notifications
      t.string :phone_number
      # t.references :preference, foreign_key: true

      t.timestamps
    end
  end
end
