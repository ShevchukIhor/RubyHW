class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    comment = Comment.all
    if comment
      render json: comment, status: :ok
    else
      render json: comment.errors, status: :bad_request
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def show
    if @ten_comments
      render json: @ten_comments, state: :ok
    else
      render json: @ten_comments.errors, status: :bad_request
    end
  end

  def destroy
    if @comment.destroy
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def published
    comment = Comment.published
    render json: comment, status: :ok
  end

  def unpublished
    comment = Comment.unpublished
    render json: comment, status: :ok
  end

  private

  def comment_params
    params.require (:comment).permit(:body, :status, :author_id, :article_id)
  end

  def set_comment
    @comment = Comment.find params[:id]
  end

  def ten_last_comments
    @ten_comments = Comment.find(params[:id]).comments.last(10)
  end
end

