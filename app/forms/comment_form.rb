# frozen_string_literal: true

class CommentForm < Reform::Form
  property :body
  property :product_id
  property :user_id

  validates :body, presence: true
  validates :product_id, presence: true
  validates :user_id, presence: true
end
