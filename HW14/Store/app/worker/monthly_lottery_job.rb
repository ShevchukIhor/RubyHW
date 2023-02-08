# frozen_string_literal: true

require 'sidekiq-scheduler'

class MonthlyLotteryJob
  include Sidekiq::Job

  def perform
    MonthlyLottery.new(lucky_user: 'Monthly Winner').call
  end
end

