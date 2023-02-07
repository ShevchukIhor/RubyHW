# frozen_string_literal: true

class MonthlyLottery
  attr_reader :lucky_user

  def initialize(lucky_user)
    @lucky_user = lucky_user
  end

  def call
    orders = Order.where(status: 'paid', created_at: Date.today - 1.month..Date.today)
    winning_users = orders.map(&:user).uniq.sample(2)
    winning_users.each do |user|
      UserMailer.lottery_winner_email(user).deliver_later
    end
  end
end
