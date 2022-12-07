class LikeController < ApplicationController
    before_action :set_like, only: %i[show create edit update destroy]

    def new
      @like = Like.new
    end

    def create
      @like = Like.new(like_params)
      if @like.save
        render json: @like, status: :created
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    #/api/v1/articles/:id(.:format)
    def show
      if @like
        render json: { article: @like, comments: @like }
      else
        render json: @like.errors, status: :bad_request
      end
    end

    def update
      if @like.update(like_params)
        render json: @like, status: :ok
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @like.destroy
        render json: @like, status: :ok
      else
        render json: @like.errors, status: :bad_request
      end
    end

    private

    def like_params
      params.require (:like).permit(:author_id, :likeable_id)
    end

    def set_like
      @like = Like.find params[:id]
    end
end
