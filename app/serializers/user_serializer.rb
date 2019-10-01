class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :username, :phone_number, :preference, :likes, :movies, :genres

end
