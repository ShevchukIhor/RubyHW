# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_one :order, dependent: :nullify
  has_one :user, dependent: :destroy

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
    line_items.includes(:product).sum(&:price_multiply_quantity)
  end
end
