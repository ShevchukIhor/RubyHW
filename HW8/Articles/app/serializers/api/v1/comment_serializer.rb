# frozen_string_literal: true

module Api
  module V1
    class CommentSerializer < ActiveModel::Serializer
      attributes :id, :body, :status, :author, :created_at

      has_one :author
    end
  end
end
