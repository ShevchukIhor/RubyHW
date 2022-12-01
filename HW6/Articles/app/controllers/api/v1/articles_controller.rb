class Api::V1::ArticlesController < ApplicationController
  before_action :set_article
  def index
    @articles = Article.all
    if @articles
      render json: @articles, status: :ok
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  def create
    @articles = Article.new(articles_params)
    if @articles.save
      render json: @articles, status: :created
    else
      render json: @articles.errors, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find id: params[:id].published
    if @articles
      render json: @articles, state: :ok
      render json: @comment
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  def destroy
    if @articles.destroy
      render json: @articles, status: :ok
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  def update
    if @articles.update(articles_params)
      render json: @articles, status: :ok
    else
      render json: @articles.errors, status: :unprocessable_entity
    end
  end

  private

  def articles_params
    params.require (:articles).permit(:title, :body)
  end

  def set_article
    @articles = Article.find params[:id]
  end
end
