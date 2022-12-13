# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_article,:fetch_comments, :fetch_tags, only: %i[show edit update destroy]
      before_action :status, only: %i[change_status]

      # GET method to get all article from database
      def index
        @article = Article.all
        render json: @article, status: :ok
      end

      # /api/v1/articles/:id(.:format)
      def show
        render json: { articles: @article, comments: @comments, tags: @tags, likes: @article.likes }
      end

      def edit; end

      def create
        @article = Article.new(articles_params)
        if @article.save
          render json: @article, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def update
        if @article.update(articles_params)
          render json: @article, status: :ok
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @article.destroy
          render json: @article, status: :ok
        else
          render json: @article.errors, status: :bad_request
        end
      end

      def published
        @article = Article.published.find(params[:article_id])
        render json: @article, status: :ok
      end

      def unpublished
        @article = Article.unpublished.find(params[:article_id])
        render json: @article, status: :ok
      end

      def change_status
        new_status = @articles.status == 'unpublished' ? 'published' : 'unpublished'
        @articles.update(status: new_status)
        render json: @articles, notice: "Article changed status to #{@articles.status}"
      end

      private

      def articles_params
        params.require :article.permit(:title, :body, :status, tags: [])
      end

      def set_article
        @article = Article.find params[:id]
      end

      def fetch_comments
        @comments = Article.find(params[:id]).comments.get_last_ten_comments
      end

      def status
        @articles = Article.find params[:article_id]
      end

      def fetch_tags
        @tags = Tag.find params[:id]
      end
    end
  end
end
