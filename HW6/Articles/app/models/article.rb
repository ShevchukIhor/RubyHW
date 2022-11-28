class Article < ApplicationRecord
  has_many :comment, dependent: :destroy
  belongs_to :author, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
