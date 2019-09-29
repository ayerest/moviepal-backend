class Genre < ApplicationRecord
    has_many :moviegenres
    has_many :movies, through: :moviegenres
    has_many :preferences
    # has_many :users, through: :preferences
    # validates :name, presence: true
end
