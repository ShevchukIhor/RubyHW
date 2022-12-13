# frozen_string_literal: true

module Api
  module V1
    class LikeController < ApplicationController
      before_action :set_like, only: %i[destroy]

      def create
        @like = Like.new(like_params)
        @likeable = @like.likeable
        if @like.save
          render json: @likeable, status: :ok
        else
          render json: @like.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @like.destroy
          render json: @like, status: :ok
        else
          render json: @like.errors, status: :bad_request
        end
      end

      private

      def like_params
        params.require :like.permit(:author_id, :likeable_id, :likeable_type)
      end

      def set_like
        @like = Like.find params[:id]
      end
    end
  end
end
