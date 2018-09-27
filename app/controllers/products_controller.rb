# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: i % (show destroy)

  def index
    @products = Product.all
  end

  def show; end

  def destroy
    redirect_to products_path if @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
