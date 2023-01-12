
# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :order, dependent: :nullify

  def add_product(product)
    if (line_items = self.line_items.find_by(product_id: product.id))
      line_items.quantity += 1
      line_items.save
      line_items
    else
      self.line_items.create(product_id: product.id, quantity: 1)
    end
  end

  def cart_total_price
    # line_items.price_multiply_quantity.map(&:product).sum(&:price)
    sum = 0
    line_items.each do |line_item|
      sum += line_item.price_multiply_quantity
    end
    sum
  end
end
