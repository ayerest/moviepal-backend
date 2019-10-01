class LikeSerializer < ActiveModel::Serializer
  attributes :id, :like, :unlike, :to_watch, :movie, :user
end
