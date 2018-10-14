# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    if comment_form.validate(params[:comment])
      comment_form.save
      redirect_to product_path(product_id)
    elsif Product.find(product_id)
      @product = Product.where(id: product_id)
                        .includes({comments: :user}, :tags)
                        .first
                        .decorate
      render 'products/show'
    else
      redirect_to products_path
    end
  end

  private

  def product_id
    comment_form.product_id
  end

  def comment_form
    @comment_form ||= CommentForm.new(Comment.new(user_id: current_user.id))
  end
end
