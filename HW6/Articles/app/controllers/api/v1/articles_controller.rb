class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @article = Article.all
    #@comment = Comment.find params[:article_id]
    if @article
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  #articles/id/
  def show
    if @article
      render json: { articles: @article, comments: @article.comment }
    else
      render json: @article.errors, status: :bad_request
    end
  end

  def destroy
    if @article.destroy
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def articles_params
    params.require (:articles).permit(:title, :body)
  end

  def set_article
    @article = Article.find params[:id]
  end
end
