# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show edit update destroy]

      def index
        comment = Comment.all
        render json: comment, status: :ok
      end

      def show
        render json: { comments: @comment }
      end

      def edit; end

      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @comment.update(comment_params)
          render json: @comment, status: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @comment.destroy
          render json: @comment, status: :ok
        else
          render json: @comment.errors, status: :bad_request
        end
      end

      def published
        comments = Article.find(params[:comment_id]).comments.published
        render json: comments, status: :ok
      end

      def unpublished
        comments = Article.find(params[:comment_id]).comments.unpublished
        render json: comments, status: :ok
      end

      def change_status
        new_status = comments.status == 'unpublished' ? 'published' : 'unpublished'
        comments.update(status: new_status)
        render json: comments, notice: "Comments changed status to #{@articles.status} "
      end

      private

      def comment_params
        params.require :comment.permit(:body, :status, :author_id, :article_id)
      end

      def set_comment
        @comment = Comment.find params[:id]
      end
    end
  end
end
