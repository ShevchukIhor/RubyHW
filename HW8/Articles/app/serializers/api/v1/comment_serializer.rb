
class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :status, :author, :created_at

  has_one :author
end