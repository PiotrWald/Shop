# frozen_string_literal: true

class Product < ApplicationRecord
  has_one :ProductPriceHistory, dependent: :destroy
end
