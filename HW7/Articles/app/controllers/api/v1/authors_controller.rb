# frozen_string_literal: true

module Api
  module V1
    class AuthorsController < ApplicationController
      before_action :set_author, only: %i[show edit update destroy]

      def index
        @author = Author.all
        if @author
          render json: @author, status: :ok
        else
          render json: @author.errors, status: :bad_request
        end
      end

      def show
        if @author
          render json: @author, state: :ok
        else
          render json: @author.errors, status: :bad_request
        end
      end

      def new
        @author = Author.new
      end

      def edit; end

      def create
        @author = Author.new(author_params)
        if @author.save
          render json: @author, status: :created
        else
          render json: @author.errors, status: :unprocessable_entity
        end
      end

      def update
        if @author.update(author_params)
          render json: @author, status: :ok
        else
          render json: @author.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @author.destroy
          render json: @author, status: :ok
        else
          render json: @author.errors, status: :bad_request
        end
      end

      private

      def author_params
        params.require :author.permit(:name)
      end

      def set_author
        @author = Author.find params[:id]
      end
    end
  end
end
