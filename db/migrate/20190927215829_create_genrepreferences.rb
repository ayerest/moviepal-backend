class CreateGenrepreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :genrepreferences do |t|
      t.references :genre, foreign_key: true
      t.references :preference, foreign_key: true

      t.timestamps
    end
  end
end
