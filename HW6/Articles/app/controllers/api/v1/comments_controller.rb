class Api::V1::CommentsController < ApplicationController
  before_action :set_comment
  def index
    @comment = Comment.all
    if @comment
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :bad_request
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
    if @comment
      render json: @comment, state: :ok
    else
      render json: @comment.errors, status: :bad_request
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

  private

  def comment_params
    params.require (:comment).permit(:body, :status, :author_id, :article_id)
  end

  def set_comment
    @comment = Comment.find params[:id]
  end
end

