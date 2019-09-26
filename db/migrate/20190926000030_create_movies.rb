class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.string :summary
      t.integer :rotten_score
      t.integer :imdb_score
      t.datetime :opening_date

      t.timestamps
    end
  end
end
