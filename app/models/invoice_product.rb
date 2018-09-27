# frozen_string_literal: true

class InvoiceProduct < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
end
