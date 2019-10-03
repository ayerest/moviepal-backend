class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :summary, :imdb_score, :opening_date, :poster_img, :stars, :trailer_url, :showtimes_url, :imdb_url, :genres, :likes, :users
end
