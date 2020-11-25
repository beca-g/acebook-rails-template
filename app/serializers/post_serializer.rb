class PostSerializer < ActiveModel::Serializer
  attributes :id, :message, :created_at, :updated_at, :user_id
end
