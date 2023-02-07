# frozen_string_literal: true

class NotifierMailer < ApplicationMailer
  def order_notify(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Confirmation your Order #{@order.id}")
  end
end
