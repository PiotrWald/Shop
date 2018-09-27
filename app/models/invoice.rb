# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :user
  has_many :invoice_products, dependent: :destroy
  has_many :products, through: :invoice_products
  enum status: %i[closed opened]

  def sum
    invoice_products.map(&:price).reduce(&:+).to_s
  end
end
