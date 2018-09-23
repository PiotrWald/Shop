# frozen_string_literal: true

class InvoiceService
  # Creates new invoice with product or adds it to existing invoice. False if fails
  def add_prodcut(product)
    @invoice = product
  end

  private

  def initialize(invoice)
    @invoice = invoice
  end
end
