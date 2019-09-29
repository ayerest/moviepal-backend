class Preference < ApplicationRecord
  # belongs_to :user
  belongs_to :genre
  has_many :genrepreferences
end
