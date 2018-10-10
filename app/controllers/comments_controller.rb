# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    save_comment
    redirect_to product_path(comment_params[:product_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :product_id)
  end

  def save_comment
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.save
  end
end
