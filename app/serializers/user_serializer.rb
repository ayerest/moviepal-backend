class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :username, :password, :preference, :likes, :movies

end
