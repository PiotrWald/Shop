# frozen_string_literal: true

class InvoiceProductDecorator < ApplicationDecorator
  delegate_all

  def price
    '$' + object.price.to_s
  end
end
