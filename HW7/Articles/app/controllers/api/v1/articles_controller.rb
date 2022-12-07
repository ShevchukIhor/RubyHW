class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show create edit update destroy]
  before_action :fetch_comments, only: %i[show]
  before_action :fetch_tags, only: %i[new edit]
  before_action :status, only: %i[published unpublished]

  # GET method to get all article from database
  def index
    @article = Article.all_by_tags(params[:tag_ids])
    if @article
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  #/api/v1/articles/:id(.:format)
  def show
    if @article
      render json: { article: @article, comments: @comment }
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

  def destroy
    if @article.destroy
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end


  def published
    @article = Article.published
    render json: @article, status: :ok
  end

  def unpublished
    @article = Article.unpublished
    render json: @article, status: :ok
  end

  def last_ten_comments
    render json: @comments, status: :ok
  end

  private

  def articles_params
    params.require (:article).permit(:title, :body, :status, tag_ids: [])
  end

  def set_article
    @article = Article.find params[:id]
  end

  def fetch_comments
    @comment = Article.find(params[:id]).comments.published
  end

  def status
    @articles = Article.all
  end

  def fetch_tags
    @tags = Tag.all
  end

  def ten_last_comments
    @comments = Article.find(params[:id]).comments.published.last(10)
  end
end
