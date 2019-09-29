class Genrepreference < ApplicationRecord
  belongs_to :movie
  belongs_to :preference
end
