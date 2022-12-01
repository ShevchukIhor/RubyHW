class Api::V1::AuthorsController < ApplicationController
  before_action :set_author

  def index
    @author = Author.all
    if @author
      render json: @author, status: :ok
    else
      render json: @author.errors, status: :bad_request
    end
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def show
    if @author
      render json: @author, state: :ok
    else
      render json: @author.errors, status: :bad_request
    end
  end

  def destroy
    if @author.destroy
      render json: @author, status: :ok
    else
      render json: @author.errors, status: :bad_request
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      render json: @author, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  private

  def author_params
    params.require (:author).permit(:name)
  end

  def set_author
    @author = Author.find params[:id]
  end
end

