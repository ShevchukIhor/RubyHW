# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  # GET /categories or /categories.json
  def index
    @categories = Category.includes([products: :image_attachment]).all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @title = @category.title
    @category = @category.products.includes([:image_attachment])
    @product_id = @category.ids
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end
end
