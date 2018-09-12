# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_user, only: :show

  def index
    @products = Product.all
  end

  def show; end

  private

  def set_user
    @product = Product.find(params[:id])
  end
end
