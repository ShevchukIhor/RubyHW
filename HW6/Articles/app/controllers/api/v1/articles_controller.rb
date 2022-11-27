class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all

    if @articles
      render json: { message: 'Fetched all the articles successfully', data: @articles }, status: :ok
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  def create
    @articles = Article.new(articles_params)

    if @articles.save
      render json: { message: 'Articles was created successfully!', data: @articles }, status: :created
    else
      render json: @articles.errors, status: :unprocessable_entity
    end
  end

  def show

    if @articles
      render json: { data: @articles }, state: :ok
    else
      render json: { message: 'Articles could not be found' }, status: :bad_request
    end
  end

  def destroy

    if @articles.destroy!
      render json: { message: 'Articles was deleted successfully' }, status: :ok
    else
      render json: { message: 'Articles does not exist' }, status: :bad_request
    end
  end

  def update

    if @articles.update!(articles_params)
      render json: { message: 'Articles was updated successfully', data: @articles }, status: :ok
    else
      render json: { message: 'Articles cannot be updated' }, status: :unprocessable_entity
    end
  end

  private

  def articles_params
    params.permit(:title, :body)
  end
end
