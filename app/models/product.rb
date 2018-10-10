# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :invoices, through: :invoice_products
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  validates :count, numericality: {greater_than_or_equal_to: 0}
end
