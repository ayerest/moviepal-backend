class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :username, :password
  # , :lists
end
