class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :username, :notifications, :phone_number, :preference, :likes, :movies, :genres

end
