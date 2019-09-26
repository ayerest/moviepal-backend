class User < ApplicationRecord
    has_many :lists
    has_one :preference
end
