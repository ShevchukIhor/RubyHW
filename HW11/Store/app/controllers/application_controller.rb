# frozen_string_literal: true

class ApplicationController < ActionController::Base
  #protect_from_forgery with: :null_session
  # without this don't work login to admin
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end
end

