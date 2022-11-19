class Article < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :body, length: { minimum: 2 }
end
