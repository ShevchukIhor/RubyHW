# frozen_string_literal: true

class AddOrderIdColumnToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :line_items, :order, foreign_key: true
  end
end
