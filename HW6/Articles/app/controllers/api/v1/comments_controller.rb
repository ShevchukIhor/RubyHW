class Api::V1::CommentsController < ApplicationController
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
    @comment = Comment.find_by id: params[:id]
    if @comment
      render json: @comment, state: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment.destroy
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :bad_request
    end
  end

  def edit
      @comment = Comment.find_by id: params[:id]
  end

  def update
    @comment = Comment.find_by id: params[:id]
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require (:comment).permit(:body, :status)
  end
end

