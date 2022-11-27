class Author < ApplicationRecord
  has_many :article, dependent: :destroy
  has_many :comment, dependent: :destroy

  validates :name, presence: true
end
