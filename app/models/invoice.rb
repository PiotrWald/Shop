# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
end
