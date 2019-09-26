class Movie < ApplicationRecord
    has_many :list_movies
    has_many :lists, through: :list_movies
    has_many :movie_genres
    has_many :genres, through: :movie_genres

end
