# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_article, :fetch_comments, :fetch_tags, only: %i[show edit update destroy]
      before_action :status, only: %i[change_status]

      # GET method to get all article from database
      def index
        @articles = Article.all
        # search by text in body or title
        @articles = @articles.search(params[:search]) if params[:search]
        # filter by status
        @articles = @articles.filter_by_status(params[:status]) if params[:status]
        # filter by author name
        @articles = @articles.filter_by_author(params[:name]) if params[:name]
        # filter by tags
        @articles = @articles.filter_by_tags(params[:tags]) if params[:tags]
        # sort by asc/desc for order
        @articles = @articles.order(created_at: params[:order]) if params[:order]
        # pagy for articles, show only 15 articles
        @pagy, @articles = pagy(@articles, items: 15)
        render json: @articles, status: :ok
      end

      # /api/v1/articles/:id(.:format)
      def show
        render json: @article, serializer: Api::V1::ArticleSerializer, status: :ok
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
        article = Article.published.find(params[:article_id])
        render json: article, status: :ok
      end

      def unpublished
        article = Article.unpublished.find(params[:article_id])
        render json: article, status: :ok
      end

      def change_status
        new_status = @articles.status == 'unpublished' ? 'published' : 'unpublished'
        @articles.update(status: new_status)
        render json: @articles, notice: "Article changed status to #{@articles.status}"
      end

      private

      def articles_params
        params.require(:article).permit(:title, :body, :status, :author_id, tags: [])
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
