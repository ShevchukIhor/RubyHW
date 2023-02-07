# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def lottery_winner_email(user)
    @user = user
    mail(to: @user.email, subject: "Congratulation you win in lottery")
  end
end
