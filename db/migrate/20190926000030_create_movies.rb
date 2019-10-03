class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.string :summary
      t.integer :imdb_score
      t.datetime :opening_date
      t.string :poster_img
      t.string :stars
      t.string :trailer_url
      t.string :showtimes_url
      t.string :imdb_url

      t.timestamps
    end
  end
end
