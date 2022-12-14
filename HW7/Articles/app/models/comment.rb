# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true

  enum :status, %i[unpublished published]
  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(status: 0) }
  scope :get_last_ten_comments, -> { last(10) }
end
