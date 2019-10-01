class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :username, :preference, :likes, :movies

end
