# frozen_string_literal: true

class InvoiceService
  # Adds a product to incoice using transaction, if succeeds returns true, false otherwise
  def add_product(product)
    begin
      ActiveRecord::Base.transaction do
        InvoiceProduct.create!(
          product_id: product.id,
          invoice_id: @invoice.id,
          price: product.price
        )
        product.update_attribute!(:count, product.count - 1)
      end
    rescue StandardError
      return false
    end

    true
  end

  private

  def initialize(invoice)
    @invoice = invoice
  end
end
