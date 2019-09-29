class Preference < ApplicationRecord
  belongs_to :user
  has_many :genrepreferences
  has_many :genres, through: :genrepreferences
end
