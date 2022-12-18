# frozen_string_literal: true

module Api
  module V1
    class AuthorSerializer < ActiveModel::Serializer
      attributes :name

      has_many :articles
      has_many :comments
    end
  end
end
