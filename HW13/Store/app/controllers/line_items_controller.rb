# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[update destroy]

  def create
    product = Product.find(params[:product_id])
    current_cart.add_product(product)
    redirect_to cart_path, notice: "#{product.name} added to cart"
  end

  def update
    if params[:add] == 'increase'
      @line_item.quantity += 1
    else
      @line_item.quantity > 1 ? (@line_item.quantity -= 1) : @line_item.destroy
    end
    @line_item.save
    redirect_back(fallback_location: current_cart)
  end

  def destroy
    @line_item.destroy
    redirect_back(fallback_location: current_cart)
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'line_item id not found' }, status: :not_found
  end
end
