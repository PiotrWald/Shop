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
        product.update!(count: product.count - 1)
      end
    rescue StandardError
      return false
    end

    true
  end

  def remove_invoice_product(invoice_product)
    return false if invoice_product.invoice_id != @invoice.id

    begin
      ActiveRecord::Base.transaction do
        product = Product.find(invoice_product.product_id)
        invoice_product.destroy!
        product.update!(count: product.count + 1)
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
