class Api::V1::ArticlesController < ApplicationController
  def set_article
    @articles = Article.find(params[:id])
  end
  def index
    @articles = Article.all
    if @articles
      render json:  @articles, status: :ok
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  def create
    set_article
    @articles = Article.new(articles_params)
    if @articles.save
      render json: @articles, status: :created
    else
      render json: @articles.errors, status: :unprocessable_entity
    end
  end

  def show
    set_article
    if @articles
      render json: @articles, state: :ok
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  def destroy
    set_article
    if @articles.destroy!
      render json: @articles, status: :ok
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  def update
    set_article
    if @articles.update(articles_params)
      render json: @articles, status: :ok
    else
      render json: @articles.errors, status: :unprocessable_entity
    end
  end

  private

  def articles_params
    params.permit(:title, :body)
  end
end
