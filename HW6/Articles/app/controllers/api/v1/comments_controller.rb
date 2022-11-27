class Api::V1::CommentsController < ApplicationController
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def index
    @comment = Comment.all
    if @comment
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def create
    set_comment
    @comment = Article.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def show
    set_comment
    if @comment
      render json: @comment, state: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def destroy
    set_comment
    if @comment.destroy
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def update
    set_comment
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.permit(:body, :status)
  end
end

