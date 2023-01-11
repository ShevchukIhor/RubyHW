class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_line_item, only: %i[destroy add_quantity reduce_quantity]

  def create
    product = Product.find(params[:product_id])
=begin
    line_item = current_cart.line_items

    if line_item.products.id == product.id
      line_item = line_items.find(params[:id])
      line_item.product = product
      line_item.quantity += 1
      line_item.save!
      redirect_to cart_path(product), notice: "#{product.name} added to cart"
    else
      current_cart.add_product(product)
      redirect_to cart_path, notice: "#{product.name} added to cart"
    end
  end
=end
  current_cart.add_product(product)
  redirect_to cart_path, notice: "#{product.name} added to cart"
  end
  def destroy
    set_line_item
    @line_item.destroy
    redirect_back(fallback_location: current_cart)
  end

  def add_quantity
    set_line_item
    @line_item.quantity += 1
    @line_item.save
    redirect_back(fallback_location: current_cart)
  end

  def reduce_quantity
    set_line_item
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
      redirect_back(fallback_location: current_cart)
    elsif @line_item.quantity == 1
      destroy
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'line_item id not found' }, status: :not_found
  end
end
