# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :likes, as: :likeable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  enum :status, %i[unpublished published], _suffix: true
  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(status: 0) }
  scope :get_last_ten_comments, -> { last(10) }
  scope :search, ->(params) { where('title || body ILIKE ?', "%#{params}%") }
  scope :filter_by_status, ->(status) { where status: }
  scope :filter_by_author, ->(name) { joins(:author).where('authors.name ILIKE ?', "%#{name}%") }
  scope :filter_by_tags, ->(tags) { joins(:tags).where('tags.name IN (?)', tags) }
end
