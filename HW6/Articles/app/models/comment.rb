class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article

  validates :body, presence: true
  enum :status, [:unpublished, :published]
  scope :published, -> { where(status: published) }
  scope :unpublished, -> { where(status: unpublished) }

end
