class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :city
  # , :lists
end
