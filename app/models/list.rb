class List < ApplicationRecord
  belongs_to :user
  has_many :listmovies
  has_many :movies, through: :listmovies
end
