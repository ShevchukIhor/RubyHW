# frozen_string_literal: true

module Api
  module V1
    class ArticleSerializer < ActiveModel::Serializer
      attributes :id, :title, :body, :author, :created_at

      has_one :author
      has_many :comments
    end
  end
end
