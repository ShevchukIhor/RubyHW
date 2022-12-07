class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :likes, as: :likeable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  enum :status, %i[unpublished published]
  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(status: 0) }
  scope :all_by_tags, ->(tag_ids) do
    article = includes(:author, :article_tags, :tags)
    article = article.joins(:tags).where(tags: tag_ids) if tag_ids
    article.order(created_at: :desc)
  end

end
