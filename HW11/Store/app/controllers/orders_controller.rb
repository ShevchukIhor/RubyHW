class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show update]


  def show; end

  def create
    @current_order = current_user.orders.create(cart: current_cart)
    cookies.delete(:cart_id)
    redirect_to order_path(@current_order), notice: 'Order was successfully created'
  end

  def update
    @order.paid!
    redirect_to order_path(@order), notice: 'Order was successfully paided'
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id]) if current_user
  rescue ActiveRecord::RecordNotFound => e
    logger.info e
    render json: { message: 'order id not found' }, status: :not_found
  end

end
