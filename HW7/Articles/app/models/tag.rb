# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :article_tags, dependent: :destroy
  has_many :articles, through: :article_tags

  validates :title, presence: true, uniqueness: true
end
