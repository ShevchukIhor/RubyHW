class Article < ApplicationRecord
  before_create :set_article
  before_update :set_article
  before_destroy :set_article

  validates :title, presence: true
  validates :body, presence: true

  def set_article
    @articles = Article.find(params[:id])
  end
end
