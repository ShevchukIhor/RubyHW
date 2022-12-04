class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

end
