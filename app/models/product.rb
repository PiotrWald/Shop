# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :invoice_products, dependent: :destroy
  has_many :products, through: :invoice_products
end
