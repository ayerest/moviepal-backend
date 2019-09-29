class Movie < ApplicationRecord
    has_many :moviegenres
    has_many :genres, through: :moviegenres
    has_many :likes
    has_many :users, through: :likes
end
