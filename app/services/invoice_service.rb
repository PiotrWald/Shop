# frozen_string_literal: true

class InvoiceService
  # Adds a product to incoice
  def add_product(product)
    InvoiceProduct.create(
      product_id: product.id,
      invoice_id: @invoice.id,
      price: product.price
    )
  end

  private

  def initialize(invoice)
    @invoice = invoice
  end
end
