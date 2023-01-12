
# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  price      :decimal(, )
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_line_items_on_cart_id     (cart_id)
#  index_line_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
class LineItem < ApplicationRecord
  belongs_to :product, dependent: :destroy
  belongs_to :cart, dependent: :destroy
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  def price_multiply_quantity
    quantity * product.price
  end
end
