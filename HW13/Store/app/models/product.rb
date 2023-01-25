# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string
#  image       :string
#  name        :string
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Product < ApplicationRecord
  belongs_to :category, dependent: :destroy
  has_many   :line_items, dependent: :destroy
  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [50, 50]
    attachable.variant :main, resize_to_limit: [200, 200]
  end
  validates :name, presence: true
end
