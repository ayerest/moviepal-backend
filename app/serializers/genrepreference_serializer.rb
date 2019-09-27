class GenrepreferenceSerializer < ActiveModel::Serializer
  attributes :id
  has_one :movie
  has_one :preference
end
