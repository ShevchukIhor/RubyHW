# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # without this don't work login to admin
  # before_action :authenticate_user!
end
