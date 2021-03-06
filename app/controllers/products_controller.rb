# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: :destroy

  def index
    @products = Product.all.decorate
  end

  def show
    @product = Product.where(id: params[:id])
                      .includes({comments: :user}, :tags)
                      .first
                      .decorate

    @comment_form = CommentForm.new(Comment.new)
  end

  def destroy
    redirect_to products_path if @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id]).decorate
  end
end
