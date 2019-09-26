class Movie < ApplicationRecord
    has_many :listmovies
    has_many :lists, through: :listmovies
    has_many :moviegenres
    has_many :genres, through: :moviegenres

end
