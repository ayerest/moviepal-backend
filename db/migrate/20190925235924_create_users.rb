class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      # t.references :preference, foreign_key: true

      t.timestamps
    end
  end
end
