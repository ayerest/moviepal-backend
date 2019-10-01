class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :summary, :rotten_score, :imdb_score, :opening_date, :genres, :likes, :users
end
