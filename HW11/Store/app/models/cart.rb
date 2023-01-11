class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :order

  def add_product(product)
    if line_items = self.line_items.find_by(product_id: product.id)
      line_items.quantity += 1
      line_items.save
      line_items
    else
      self.line_items.create(product_id: product.id, quantity: 1)
    end
  end


  def total_price
    line_items.map(&:product).sum(&:price)
  end
end
