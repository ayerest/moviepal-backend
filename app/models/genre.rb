class Genre < ApplicationRecord
    has_many :moviegenres
    has_many :movies, through: :moviegenres
    has_many :genrepreferences
    has_many :preferences, through: :genrepreferences
    # has_many :users, through: :preferences
    # validates :name, presence: true
end
