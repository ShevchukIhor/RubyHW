class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show create edit update destroy published unpublished]
  before_action :fetch_comments, only: %i[show]
  before_action :fetch_tags, only: %i[new edit]

  # GET method to get all article from database
  def index
    @article = Article.all_by_tags(params[:tag_ids])
    if @article
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end

  # GET method for the new article
  def new
    @article = Article.new
  end

  # POST method for processing form data
  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # GET method to get a article by id
  #/api/v1/articles/:id(.:format)
  def show
    if @article
      render json: { article: @article, comments: @comment }
    else
      render json: @article.errors, status: :bad_request
    end
  end

  # GET method for editing a article based on id
  def edit
  end

  # PUT method for updating in database a article based on id
  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE method for deleting a product from database based on id
  def destroy
    if @article.destroy
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :bad_request
    end
  end

  def published
    @article = Article.published
    render json: @article
  end

  def unpublished
    @article = Article.unpublished
    render json: @article
  end

  def ten_last_comment
    comments.published.last 10
  end

  private

  def articles_params
    params.require (:article).permit(:title, :body, tag_ids: [])
  end

  def set_article
    @article = Article.find params[:id]
  end

  def fetch_comments
    @comment = Article.find params[:id].comments.published
  end

  def fetch_tags
    @tags = Tag.all
  end
end
