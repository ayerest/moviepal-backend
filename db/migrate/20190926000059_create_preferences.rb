class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.references :user, foreign_key: true
      t.integer :strength

      t.timestamps
    end
  end
end
