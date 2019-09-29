class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :preference, :likes, :movies
end
