class User < ApplicationRecord
    has_many :lists
    has_many :listmovies, through: :lists
    has_one :preference
    has_many :likes
end
