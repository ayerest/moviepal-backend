class User < ApplicationRecord
    has_one :preference
    has_many :likes
    has_many :movies, through: :likes
    # has_secure_password
end
